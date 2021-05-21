use cstr::cstr;
use qmetaobject::*;
use midiprog::*;

#[derive(QObject, Default)]
struct ParameterHandler{
    base: qt_base_class!(trait QObject),
    
    parameters: qt_property!(QVariantList; NOTIFY parameters_changed),
    parameters_changed: qt_signal!(),

    sysex_config: qt_property!(QString; NOTIFY sysex_config_changed),
    sysex_config_changed: qt_signal!(),
    
    update_param: qt_method!(fn update_param(&self, param: usize, value: usize) {
        println!("{} {}", param, value)
    })
}

fn main() {

    let cfg = "config/PG300/PG300".to_string();

    let mut i = midiprog::lib::interpreter::Interpreter::new();
    i.run_commands_str(&[
        "midiconfig data/midi.json".to_owned(),
        "config config/PG300/PG300.json".to_owned(),
        "synth ju-2".to_owned(),
    ]).unwrap();


    qml_register_type::<ParameterHandler>(cstr!("ParameterHandler"), 1, 0, cstr!("ParameterHandler"));

    let mut engine = QmlEngine::new();

    // (Here the QML code is inline, but one can also load from a file)
    engine.load_file("config/PG300/PG300.qml".into());
    engine.exec();
}