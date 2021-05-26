import QtQuick 2.14
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
import QtQuick.Window 2.14
//import ParameterHandler 1.0

ApplicationWindow  {
    width: 1280
    height: 960
    visible: true
    title: qsTr("DW-8P")

    property var slider_values: [
        [0, 3], // OSC 1 OCTAVE
        [0, 15], // OSC1 WF
        [0, 31], // OSC 1 LEVEL
        [0, 3], // A B SELECT
        [0, 1], // A B MODE
        [0, 31], // A B TIME
        [0, 31], // A B INT
        [0, 3], // OSC 3 OCTAVE
        [0, 15], // OSC 2 WF
        [0, 31], // OSC 2 LEVEL
        [0, 5], // OSC 2 INTERVAL
        [0, 6], // OSC 2 DETUNE
        [0, 31], // NOISE LEVEL
        [0, 3], // ASSIGN MODE
        [0, 62], // PAR. NO. MEMO
        [0, 31], // CUTOFF
        [0, 63], // RESONANCE
        [0, 3], // KBD TRACK
        [0, 1], // POLARITY
        [0, 31], // VCF EG INT
        [0, 31], // VCF ATTACK
        [0, 31], // VCF DECAY
        [0, 31], // VCF BREAK P
        [0, 31], // VCF SLOPE
        [0, 31], // VCF SUSTAIN
        [0, 31], // VCF RELEASE
        [0, 31], // VCF V SENS
        [0, 31], // VCA ATTACK
        [0, 31], // VCA DECAY
        [0, 31], // VCA BREAK P
        [0, 31], // VCA SLOPE
        [0, 31], // VCA SUSTAIN
        [0, 31], // VCA RELEASE
        [0, 31], // VCA V SENS
        [0, 3], // MG WAFEFORM
        [0, 31], // MG FREQUENCY
        [0, 31], // MG DELAY
        [0, 31], // MG OSC
        [0, 31], // MG VCF
        [0, 13], // BEND OSC
        [0, 1], // BEND VCF
        [0, 7], // DELAY TIME
        [0, 15], // DELAY FACTOR
        [0, 15], // D FEEDBACK
        [0, 31], // D FREQUENCY
        [0, 31], // D INTENSITY
        [0, 15], // D EFF LEVEL
        [0, 31], // PORTAMENTO
        [0, 3], // AFTERTOUCH OSC MG
        [0, 3], // AFTERTOUCH VCF
        [0, 3] // AFTERTOUCH VCA
    ]

    Item {

        /* Main Slider */
        component DW8PSlider: ColumnLayout {
            property string text
            //property real min: 0.0
            //property real max: 127.0
            //property real step: 1.0
            property int paramId: 0

            Text {
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                text: parent.text
            }

            Slider {
                Layout.alignment: Qt.AlignCenter
                orientation: Qt.Vertical
                from: slider_values[paramId][0]
                to: slider_values[paramId][1]
                stepSize: 1
                snapMode: Slider.SnapAlways

                onMoved: {
                    param_handler.update_param(parent.paramId, value)
                }
            }
        }

        component OSC: GroupBox {
            title: "OSC"

            RowLayout {
                anchors.fill: parent

                /* Pitch */
                GroupBox {
                    title: "Pitch"

                    RowLayout {
                        anchors.fill: parent
                        
                        DW8PSlider {
                            text: "GLIDE"
                        }

                        DW8PSlider {
                            text: "JOYSTICK"
                        }

                        DW8PSlider {
                            text: "MG AMT"
                        }
                    }
                }

                /* OSC 1 */
                GroupBox {
                    title: "OSC1"

                    RowLayout {
                        DW8PSlider {
                            text: "WAVE"
                            paramId: 1
                        }

                        DW8PSlider {
                            text: "OCTAVE"
                            paramId: 0
                        }
                    }
                }

                /* OSC 2 */
                GroupBox {
                    title: "OSC2"

                    RowLayout {
                        DW8PSlider {
                            text: "WAVE"
                        }

                        DW8PSlider {
                            text: "OCTAVE"
                        }

                        DW8PSlider {
                            text: "INTERVAL"
                        }

                        DW8PSlider {
                            text: "DETUNE"
                        }
                    }
                }

                /* Ramp Generator */
                GroupBox {
                    title: "Ramp Generator"

                    RowLayout {
                        DW8PSlider {
                            text: "RATE"
                        }

                        DW8PSlider {
                            text: "WIDTH"
                        }
                    }
                }
            }
        }

        component EFFECTS: GroupBox {
            title: "EFFECTS"
            RowLayout {
                /* DIGITAL DELAY */
                GroupBox {
                    title: "DIGITAL DELAY"

                    RowLayout {
                        DW8PSlider {
                            text: "TIME"
                        }

                        DW8PSlider {
                            text: "FEEDBACK"
                        }

                        DW8PSlider {
                            text: "MOD RATE"
                        }

                        DW8PSlider {
                            text: "MOD DEPTH"
                        }

                        DW8PSlider {
                            text: "LEVEL"
                        }
                    }
                }

                /* CHORUS */
                GroupBox {
                    title: "CHORUS"
                }
            }   
        }

        component TOUCH: GroupBox {
            title: "TOUCH"

            GroupBox {
                title: "AFTERTOUCH"

                RowLayout {
                    DW8PSlider {
                        text: "VIBRATO"
                    }

                    DW8PSlider {
                        text: "VCF"
                    }

                    DW8PSlider {
                        text: "VOL"
                    }
                }
            }
        }

        component MG: GroupBox {
            title: "MG"

            GroupBox {
                title: "MODULATION GENERATOR"

                RowLayout {
                    DW8PSlider {
                        text: "WAVE"
                    }

                    DW8PSlider {
                        text: "DELAY"
                    }

                    DW8PSlider {
                        text: "RATE"
                    }
                }
            }
        }

        component MIX: GroupBox {
            title: "MIX"

            GroupBox {
                title: "MIXER"

                RowLayout {
                    DW8PSlider {
                        text: "OSC1"
                    }

                    DW8PSlider {
                        text: "OSC2"
                    }

                    DW8PSlider {
                        text: "NOISE"
                    }
                }
            }
        }

        component VCF: GroupBox {
            title: "VCF"

            GroupBox {
                title: "VOLTAGE CONTROLLED FILTER"

                RowLayout {
                    DW8PSlider {
                        text: "CUTOFF"
                    }

                    DW8PSlider {
                        text: "RES"
                    }

                    DW8PSlider {
                        text: "KEY TRK"
                    }

                    DW8PSlider {
                        text: "MG AMT"
                    }

                    DW8PSlider {
                        text: "ENV AMT"
                    }
                }
            }
        }

        component F_ENV: GroupBox {
            title: "F ENV"

            GroupBox {
                title: "FILTER ENVELOPE"

                RowLayout {
                    DW8PSlider {
                        text: "ATTACK"
                    }

                    DW8PSlider {
                        text: "DECAY"
                    }

                    DW8PSlider {
                        text: "BREAK LEV"
                    }

                    DW8PSlider {
                        text: "SLOPE"
                    }

                    DW8PSlider {
                        text: "SUSTAIN"
                    }

                    DW8PSlider {
                        text: "RELEASE"
                    }

                    DW8PSlider {
                        text: "V SENS"
                    }
                }
            }
        }

        component A_ENV: GroupBox {
            title: "A ENV"

            GroupBox {
                title: "AMPLIFIER ENVELOPE"

                RowLayout {
                    DW8PSlider {
                        text: "ATTACK"
                    }

                    DW8PSlider {
                        text: "DECAY"
                    }

                    DW8PSlider {
                        text: "BREAK LEV"
                    }

                    DW8PSlider {
                        text: "SLOPE"
                    }

                    DW8PSlider {
                        text: "SUSTAIN"
                    }

                    DW8PSlider {
                        text: "RELEASE"
                    }

                    DW8PSlider {
                        text: "V SENS"
                    }
                }
            }
        }

        ColumnLayout {
            RowLayout {
                OSC {}
                MIX {}
                VCF {}
            }

            RowLayout {
                F_ENV {}
                A_ENV {}
            }

            RowLayout {
                EFFECTS {}
                TOUCH {}
                MG {}
            }
        }
    }
}
