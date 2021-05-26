import QtQuick 2.14
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
import QtQuick.Window 2.14
import ParameterHandler 1.0

ApplicationWindow  {
    width: 1280
    height: 960
    visible: true
    title: qsTr("PG-300")

    Item {
        /* Main Slider */
        component PG300Slider: ColumnLayout {
            property string text
            property real min: 0.0
            property real max: 127.0
            property real step: 1.0
            property int paramId: 0

            Text {
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                text: parent.text
                height: 25
            }

            Slider {
                Layout.alignment: Qt.AlignCenter
                orientation: Qt.Vertical
                from: parent.min
                to: parent.max
                stepSize: parent.step
                snapMode: Slider.SnapAlways
                value: param_handler.parameters[paramId]
                height: 200

                onMoved: {
                    param_handler.update_param(parent.paramId, value)
                }
            }
        }

        /* PG300 Bender */
        component PG300Bender: GroupBox {
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

        /* PG300 Chorus */
        component PG300Chorus: GroupBox {
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

        /* PG300 DCO */
        component PG300DCO: GroupBox {
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

        /* PG300 Enveloppe */
        component PG300ENV: GroupBox {
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

        /* PG300 LFO */
        component PG300LFO: GroupBox {
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

        /* PG300 VCA */
        component PG300VCA: GroupBox {
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

        /* PG300 VCF */
        component PG300VCF: GroupBox {
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
        
        /* Main Layout */
        ColumnLayout {
            RowLayout {
                PG300DCO {}

                PG300VCF {
                    Layout.alignment: Qt.AlignBottom
                }
            }

            RowLayout {
                PG300VCA {}
                PG300Chorus {}
                PG300ENV {}
                PG300Bender {}
            }
        }
    }
}
