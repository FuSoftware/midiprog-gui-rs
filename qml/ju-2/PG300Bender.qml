import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        RowLayout {
            PG300Slider{
                id: param35
                Layout.alignment: Qt.AlignBottom
                text: "BENDER\nRANGE"
                min: 0
                max: 12
                step: 1
                paramId: 35
            }
        }
    }
}
