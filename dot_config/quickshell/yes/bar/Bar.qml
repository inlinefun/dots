import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.animations
import qs.bar.components
import qs.common

PanelWindow {
    id: window
    anchors {
        bottom: !Config.topBar
        left: true
        right: true
        top: Config.topBar
    }
    implicitHeight: Constants.barHeight
    color: "transparent"
    Rectangle {
        id: container
        anchors {
            fill: parent
            topMargin: Config.topBar ? Constants.outerMargin : 0
            leftMargin: Constants.outerMargin
            rightMargin: Constants.outerMargin
            bottomMargin: Config.topBar ? 0 : Constants.outerMargin
        }
        radius: Constants.outerMargin > 0 ? Constants.radius : 0
        color: Colors.surface
        border {
            color: Colors.surface_container_highest
            width: Constants.outerMargin > 0 ? Config.barOutline : 0
        }
        RowLayout {
            id: left
            anchors {
                top: container.top
                left: container.left
                bottom: container.bottom
                margins: 5
            }
            AppLauncher {}
        }
        RowLayout {
            id: center
            anchors {
                top: container.top
                bottom: container.bottom
                horizontalCenter: container.horizontalCenter
                margins: 5
            }
            DateTime {}
        }
        RowLayout {
            id: right
            anchors {
                top: container.top
                right: container.right
                bottom: container.bottom
                margins: 5
            }
        }
    }
}
