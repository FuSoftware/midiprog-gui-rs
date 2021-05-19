import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "ENV"
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            PG300Slider {
                id: param26
                Layout.alignment: Qt.AlignBottom
                text: "T1"
                min: 0
                max: 127
                step: 1
                paramId: 26
            }
            PG300Slider {
                id: param27
                Layout.alignment: Qt.AlignBottom
                text: "L1"
                min: 0
                max: 127
                step: 1
                paramId: 27
            }
            PG300Slider {
                id: param28
                Layout.alignment: Qt.AlignBottom
                text: "T2"
                min: 0
                max: 127
                step: 1
                paramId: 28
            }
            PG300Slider {
                id: param29
                Layout.alignment: Qt.AlignBottom
                text: "L2"
                min: 0
                max: 127
                step: 1
                paramId: 29
            }
            PG300Slider {
                id: param30
                Layout.alignment: Qt.AlignBottom
                text: "T3"
                min: 0
                max: 127
                step: 1
                paramId: 30
            }
            PG300Slider {
                id: param31
                Layout.alignment: Qt.AlignBottom
                text: "L3"
                min: 0
                max: 127
                step: 1
                paramId: 31
            }
            PG300Slider {
                id: param32
                Layout.alignment: Qt.AlignBottom
                text: "T4"
                min: 0
                max: 127
                step: 1
                paramId: 32
            }
            PG300Slider {
                id: param33
                text: "KEY\nFOLLOW"
                min: 0
                max: 127
                step: 1
                paramId: 33
            }
        }
    }
}
