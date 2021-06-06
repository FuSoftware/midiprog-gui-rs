use cstr::cstr;
use qmetaobject::*;
use std::{borrow::BorrowMut, path::Path, sync::Arc,  cell::RefCell, sync::Mutex};
use midiprog::*;

#[macro_use]
extern crate lazy_static;

struct Config {
    ui: String,
    commands: Vec<String>,
    folder: String,
    parameters: usize,
}

impl Config {
    pub fn new() -> Config {
        Config {
            ui: String::new(),
            commands: Vec::new(),
            folder: String::new(),
            parameters: 0
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
        cfg.parameters = parsed["parameters"].as_usize().unwrap();

        for val in parsed["commands"].members() {
            cfg.commands.push(val.to_string());
        }
        return cfg;
    }
}


#[derive(QObject, Default)]
struct QInterpreter {
    base: qt_base_class!(trait QObject),

    inner: midiprog::lib::interpreter::Interpreter,

    parameter_changed: qt_signal!(parameter: usize, value: u64),

    update_param: qt_method!(fn update_param(&mut self, param: usize, value: usize) {
        let r = self.inner.run_command(midiprog::lib::interpreter::InterpreterCommand::Sysex("ipr".to_owned(), vec![param, value]));

        match r {
            Err(e) => {
                println!("{}", e);
            }

            _ => {}
        }
    }),
}

#[derive(QObject, Default)]
struct ParameterHandler{
    base: qt_base_class!(trait QObject),
    
    parameters: qt_property!(QVariantList; NOTIFY parameters_changed),
    parameters_changed: qt_signal!(),

    sysex_config: qt_property!(QString; NOTIFY sysex_config_changed),
    sysex_config_changed: qt_signal!(),
}

impl ParameterHandler {
    pub fn update_param_value(&mut self, parameter: usize, value: u64) {
        self.parameters[parameter] = QVariant::from(value);
        self.parameters_changed();
    }   
}

fn main() {
    let cfg = Config::from_file("config/PG300/config.json");

    let mut param_handler = ParameterHandler {
        ..Default::default()
    };

    let mut interpreter = QInterpreter {
        ..Default::default()
    };

    // Change current dir
    let root = Path::new(&cfg.folder);
    match std::env::set_current_dir(root) {
        Ok(()) => {
            for command in &cfg.commands {
                match interpreter.inner.run_command_str(command) {        
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

                    _ => {}
                }
            }

            while param_handler.parameters.len() < cfg.parameters {
                param_handler.parameters.push(QVariant::from(0));
            }

            interpreter.inner.run_command(midiprog::lib::interpreter::InterpreterCommand::SysexList).unwrap();   

            let set_value = qmetaobject::queued_callback(move |(a, b)| {
                let qptr = QPointer::from(&interpreter);
                qptr.as_pinned().map(|this| {
                    this.borrow().parameter_changed(a, b);
                });
            });

            interpreter.inner.set_input_callback(move |s, d| {
                set_value((d[1] as usize, d[2] as u64));
            });

            /* Custom Types */
            qml_register_type::<ParameterHandler>(cstr!("ParameterHandler"), 1, 0, cstr!("ParameterHandler"));
            qml_register_type::<QInterpreter>(cstr!("QInterpreter"), 1, 0, cstr!("QInterpreter"));

            let ph = Arc::new(RefCell::new(param_handler));
            let qi = Arc::new(RefCell::new(interpreter));
            let o: QObjectPinned<ParameterHandler>;
            let i: QObjectPinned<QInterpreter>;

            unsafe{
                o =  QObjectPinned::new(&ph);
                i =  QObjectPinned::new(&qi);
            }

            let mut engine = QmlEngine::new();
            engine.set_object_property("param_handler".into(), o);
            engine.set_object_property("midi_interpreter".into(), i);    
            engine.load_file(cfg.ui.into());
            engine.exec();
        }

        Err(e) => {
            println!("Error setting the current directoty : {} ({})", e, &cfg.folder);
        }
    }
}