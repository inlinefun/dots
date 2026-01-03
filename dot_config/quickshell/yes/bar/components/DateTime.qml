import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.animations
import qs.components
import qs.common

MouseArea {
    id: root
    Layout.fillHeight: true
    hoverEnabled: true
    implicitWidth: label.implicitWidth + 10
    Rectangle {
        anchors {
            fill: parent
        }
        radius: Constants.radius
        color: Colors.surface_container_low
        opacity: root.containsMouse ? 1 : 0
        Behavior on opacity {
            AnimateNumber {}
        }
    }
    CText {
        id: label
        anchors {
            centerIn: parent
        }
        color: Colors.on_surface
        text: Qt.formatDateTime(clock.date, "hh:mm A | MMM dd")
        size: 15
    }
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
