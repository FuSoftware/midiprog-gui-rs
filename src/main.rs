use cstr::cstr;
use qmetaobject::*;
use std::path::Path;
use midiprog::*;
use json::*;

struct Config {
    ui: String,
    commands: Vec<String>,
    folder: String,
}

impl Config {
    pub fn new() -> Config {
        Config {
            ui: String::new(),
            commands: Vec::new(),
            folder: String::new(),
        }
    }

    pub fn from_file(path: &str) -> Config {
        let text = std::fs::read_to_string(path).unwrap();
        let p = Path::new(path);
        let folder = p.parent().unwrap().to_str().unwrap().to_owned();
        return Config::from_string(&folder, &text)
    }

    pub fn from_string(folder: &str, s: &str) -> Config {
        let mut cfg = Config::new();
        cfg.folder = folder.to_owned();
        let parsed = json::parse(s).expect("Couldn't parse the config file");
        cfg.ui = parsed["ui"].to_string();

        for val in parsed["commands"].members() {
            cfg.commands.push(val.to_string());
        }
        return cfg;
    }
}

#[derive(QObject, Default)]
struct ParameterHandler{
    base: qt_base_class!(trait QObject),
    
    parameters: qt_property!(QVariantList; NOTIFY parameters_changed),
    parameters_changed: qt_signal!(),

    sysex_config: qt_property!(QString; NOTIFY sysex_config_changed),
    sysex_config_changed: qt_signal!(),

    interpreter: midiprog::lib::interpreter::Interpreter,

    raw_command: qt_method!(fn raw_command(&mut self, command: String) {
        self.interpreter.run_command_str(&command);
    }),
    
    update_param: qt_method!(fn update_param(&mut self, param: usize, value: usize) {
        /*
        let r = self.interpreter.run_command(midiprog::lib::interpreter::InterpreterCommand::Sysex("ipr".to_owned(), vec![param, value]));

        match r {
            Ok(()) => {

            }

            Err(e) => {
                println!("{}", e);
            }
        }
        */
    }),
}

fn main() {
    let cfg = Config::from_file("config/PG300/config.json");

    let mut param_handler = ParameterHandler {
        interpreter: midiprog::lib::interpreter::Interpreter::new(),
        ..Default::default()
    };

    // Change current dir
    let root = Path::new(&cfg.folder);
    match std::env::set_current_dir(root) {
        Ok(()) => {
            for command in &cfg.commands {
                match param_handler.interpreter.run_command_str(command) {
                    Ok(()) => {
                        
                    }
        
                    Err(e) => {
                        match e {
                            midiprog::lib::interpreter::InterpreterError::InterfaceError(e) => {
                                println!("Midi interface error : {}", e);
                            },
        
                            midiprog::lib::interpreter::InterpreterError::MidiSendError(e) => {
                                println!("Midi communication error : {}", e);
                            }
        
                            midiprog::lib::interpreter::InterpreterError::SimpleError(s) => {
                                println!("{}", s)
                            }
                        }
                    }
                }
            }

            param_handler.interpreter.run_command(midiprog::lib::interpreter::InterpreterCommand::SysexList);

            for i in 0..40 {
                param_handler.parameters.push(QVariant::from(0));
            }

            qml_register_type::<ParameterHandler>(cstr!("ParameterHandler"), 1, 0, cstr!("ParameterHandler"));

            let mut engine = QmlEngine::new();

            let c = std::cell::RefCell::new(param_handler);
            let o: QObjectPinned<ParameterHandler>;
            
            unsafe{
                o =  QObjectPinned::new(&c);
            }

            engine.set_object_property("param_handler".into(), o);
            engine.load_file(cfg.ui.into());
            engine.exec();
        }

        Err(e) => {
            println!("Error setting the current directoty : {} ({})", e, &cfg.folder);
        }
    }
}