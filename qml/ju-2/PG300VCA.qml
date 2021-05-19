import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        anchors.fill: parent
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "VCA"
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            PG300Slider {
                id: param22
                text: "LEVEL"
                min: 0
                max: 127
                step: 1
                paramId: 22
            }

            PG300Slider {
                id: param2
                text: "ENV\nMODE"
                min: 0
                max: 3
                step: 1
                paramId: 2
            }

            PG300Slider {
                id: param23
                text: "AFTER"
                min: 0
                max: 127
                step: 1
                paramId: 23
            }
        }
    }
}
