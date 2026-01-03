import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.animations
import qs.common
import qs.icons

MouseArea {
    id: root
    Layout.fillHeight: true
    implicitWidth: height
    hoverEnabled: true
    onClicked: _ => {
        Quickshell.execDetached(["rofi", "-show", "drun"]);
    }
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
    SearchIcon {
        id: icon
        anchors {
            centerIn: parent
        }
        size: 24
        color: Colors.on_surface_variant
    }
}
