import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "VCF"
        }

        RowLayout {
            PG300Slider{
                id: param9
                Layout.alignment: Qt.AlignBottom
                text: "HPF"
                min: 0
                max: 3
                step: 1
                paramId: 9
            }
            PG300Slider{
                id: param16
                Layout.alignment: Qt.AlignBottom
                text: "FREQ"
                min: 0
                max: 127
                step: 1
                paramId: 16
            }
            PG300Slider{
                id: param17
                Layout.alignment: Qt.AlignBottom
                text: "RES"
                min: 0
                max: 127
                step: 1
                paramId: 17
            }
            PG300Slider{
                id: param18
                Layout.alignment: Qt.AlignBottom
                text: "LFO"
                min: 0
                max: 127
                step: 1
                paramId: 18
            }
            PG300Slider{
                id: param19
                Layout.alignment: Qt.AlignBottom
                text: "ENV"
                min: 0
                max: 127
                step: 1
                paramId: 19
            }
            PG300Slider{
                id: param1
                Layout.alignment: Qt.AlignBottom
                text: "ENV\nMODE"
                min: 0
                max: 3
                step: 1
                paramId: 1
            }
            PG300Slider{
                id: param20
                Layout.alignment: Qt.AlignBottom
                text: "KEY\nFOLLOW"
                min: 0
                max: 127
                step: 1
                paramId: 20
            }
            PG300Slider{
                id: param21
                Layout.alignment: Qt.AlignBottom
                text: "AFTER"
                min: 0
                max: 127
                step: 1
                paramId: 21
            }
        }
    }
}
