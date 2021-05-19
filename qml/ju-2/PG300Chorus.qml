import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "CHORUS"
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            PG300Slider {
                id: param10
                Layout.alignment: Qt.AlignBottom
                text: "ON\nOFF"
                min: 0
                max: 1
                step: 1
                paramId: 10
            }

            PG300Slider {
                id: param34
                text: "RATE"
                min: 0
                max: 127
                step: 1
                paramId: 34            
            }
        }
    }
}
