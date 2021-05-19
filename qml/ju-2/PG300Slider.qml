import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    property string text
    property real min: 0.0
    property real max: 100.0
    property real step: 1.0
    property int paramId: 0

    Text {
        Layout.alignment: Qt.AlignCenter
        horizontalAlignment: Text.AlignHCenter
        text: parent.text
    }

    Slider {
        Layout.alignment: Qt.AlignCenter
        orientation: Qt.Vertical
        from: parent.min
        to: parent.max
        stepSize: parent.step
        snapMode: Slider.SnapAlways

        onMoved: {
            param_handler.update_param(parent.paramId, value)
        }
    }
}
