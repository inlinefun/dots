import QtQuick
import QtQuick.Layouts
import Quickshell
import "../util"

PanelWindow {
    id: bar
    anchors {
        left: true
        top: true
        right: true
    }
    implicitHeight: 32
    color: Colors.surface

    RowLayout {
        id: barLeft
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            leftMargin: height / 4
            rightMargin: height / 4
        }
        spacing: height / 4
        Workspaces {}
    }

    RowLayout {
        id: barCenter
        anchors {
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            leftMargin: height / 4
            rightMargin: height / 4
        }
        spacing: height / 4
    }

    RowLayout {
        id: barRight
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            leftMargin: height / 4
            rightMargin: height / 4
        }
        spacing: height / 4
    }

}