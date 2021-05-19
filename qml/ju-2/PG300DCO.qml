import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

GroupBox {
    ColumnLayout {
        RowLayout {
            PG300LFO {}

            ColumnLayout {
                Text {
                    Layout.alignment: Qt.AlignCenter
                    text: "DCO"
                }

                RowLayout {
                    Layout.alignment: Qt.AlignCenter
                    PG300Slider{
                        id: param6
                        Layout.alignment: Qt.AlignBottom
                        text: "RANGE"
                        min: 0
                        max: 3
                        step: 1
                        paramId: 6
                    }
                    PG300Slider{
                        id: param11
                        Layout.alignment: Qt.AlignBottom
                        text: "LFO"
                        min: 0
                        max: 127
                        step: 1
                        paramId: 11
                    }
                    PG300Slider{
                        id: param12
                        Layout.alignment: Qt.AlignBottom
                        text: "ENV"
                        min: 0
                        max: 127
                        step: 1
                        paramId: 12
                    }
                    PG300Slider{
                        id: param0
                        Layout.alignment: Qt.AlignBottom
                        text: "ENV\nMODE"
                        min: 0
                        max: 3
                        step: 1
                        paramId: 0
                    }
                    PG300Slider{
                        id: param13
                        Layout.alignment: Qt.AlignBottom
                        text: "AFTER"
                        min: 0
                        max: 127
                        step: 1
                        paramId: 13
                    }
                }
            }
        }

        RowLayout {
            PG300Slider {
                id: param3
                Layout.alignment: Qt.AlignBottom
                text: "PULSE"
                min: 0
                max: 3
                step: 1
                paramId: 3
            }

            PG300Slider {
                id: param4
                Layout.alignment: Qt.AlignBottom
                text: "SAW\nTOOTH"
                min: 0
                max: 5
                step: 1
                paramId: 4
            }

            PG300Slider {
                id: param5
                Layout.alignment: Qt.AlignBottom
                text: "SUB"
                min: 0
                max: 5
                step: 1
                paramId: 5
            }

            PG300Slider {
                id: param7
                Layout.alignment: Qt.AlignBottom
                text: "SUB\nLEVEL"
                min: 0
                max: 3
                step: 1
                paramId: 7
            }

            PG300Slider {
                id: param8
                Layout.alignment: Qt.AlignBottom
                text: "NOISE\nLEVEL"
                min: 0
                max: 3
                step: 1
                paramId: 8
            }

            PG300Slider {
                id: param14
                Layout.alignment: Qt.AlignBottom
                text: "PWM"
                min: 0
                max: 127
                step: 1
                paramId: 14
            }

            PG300Slider {
                id: param15
                Layout.alignment: Qt.AlignBottom
                text: "PWM\nRATE"
                min: 0
                max: 127
                step: 1
                paramId: 15
            }

        }
    }
}
