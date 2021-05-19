import QtQuick 2.14
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import ParameterHandler 1.0

Item {
    ParameterHandler {
        id: param_handler
        sysex_config: "ju-2.json"
    }
    
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
