use cstr::cstr;
use qmetaobject::*;

qrc!(my_resource,
    "midiprog/qml" {
        "qml/main.qml",
        "qml/ju-2/PG300.qml",
        "qml/ju-2/PG300Slider.qml",
        "qml/ju-2/PG300LFO.qml",
        "qml/ju-2/PG300DCO.qml",
        "qml/ju-2/PG300VCA.qml",
        "qml/ju-2/PG300VCF.qml",
        "qml/ju-2/PG300ENV.qml",
        "qml/ju-2/PG300Chorus.qml",
        "qml/ju-2/PG300Bender.qml",
    },
);

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
    my_resource();
    qml_register_type::<ParameterHandler>(cstr!("ParameterHandler"), 1, 0, cstr!("ParameterHandler"));

    let mut engine = QmlEngine::new();

    // (Here the QML code is inline, but one can also load from a file)
    engine.load_file("qrc:/midiprog/qml/qml/main.qml".into());
    engine.exec();
}