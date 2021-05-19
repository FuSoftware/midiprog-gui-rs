import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        Text {
            Layout.alignment: Qt.AlignCenter
            text: "LFO"
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            PG300Slider {
                id: param24
                text: "RATE"
                min: 0
                max: 127
                step: 1
                paramId: 24
            }

            PG300Slider {
                id: param25
                text: "DELAY"
                min: 0
                max: 127
                step: 1
                paramId: 25
            }
        }
    }
}
