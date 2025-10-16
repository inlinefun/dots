import Quickshell
import QtQuick

pragma Singleton

Singleton {
    property var linear: QEasing.curve(0.00, 0.00, 1.00, 1.00)
    property var e_accel: QEasing.curve(0.30, 0.00, 0.80, 0.15)
    property var e_decel: QEasing.curve(0.05, 0.70, 0.10, 1.00)
    property var s_accel: QEasing.curve(0.30, 0.00, 1.00, 1.00)
    property var s_decel: QEasing.curve(0.00, 0.00, 0.00, 1.00)
    property var l_accel: QEasing.curve(0.40, 0.00, 1.00, 1.00)
    property var l_decel: QEasing.curve(0.00, 0.00, 0.20, 1.00)

    property int d_short: 200
    property int d_medium: 300
    property int d_long: 450
}
