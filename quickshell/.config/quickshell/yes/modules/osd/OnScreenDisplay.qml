import qs.util

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Scope {
    id: root
    property int brightness: -1
    property bool visible: false

    Process {
        id: brightnessMon
        command: ["brightnessctl", "-m"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                var output = this.text.trim()
                var parts = output.split(",") // dummy output: intel_backlight,backlight,19200,100%,19200
                if (parts.length > 3) {
                    var formatted = parts[3].replace('%', ' ').trim()
                    var value = parseInt(formatted)
                    if (!isNaN(value) && value >= 0 && value <= 100 && root.brightness != value) {
                        if (root.brightness != -1) {
                            root.visible = true
                            visibilityTimer.restart()
                        }
                        root.brightness = value
                    }
                }
            }
        }
    }

    Timer {
        id: pollTimer
        interval: 150
        running: true
        repeat: true
        onTriggered: brightnessMon.running = true
    }
    Timer {
        id: visibilityTimer
        interval: 3000
        running: false
        repeat: false
        onTriggered: root.visible = false 
    }

    PanelWindow {
        visible: root.visible || osdContainer.opacity > 0
        aboveWindows: true
        focusable: false
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        implicitWidth: 180
        implicitHeight: 50
        anchors {
            top: true
        }
        margins {
            top: root.visible ? 60 : 0
        }

        Behavior on margins.top {
            NumberAnimation {
                easing.type: Animations.e_accel
                duration: Animations.d_short
            }
        }

        Rectangle {
            id: osdContainer
            anchors.fill: parent
            color: Colors.surface
            radius: parent.height / 4
            border.color: Colors.primary
            border.width: 2
            opacity: root.visible ? 1 : 0

            Behavior on opacity {
                NumberAnimation {
                    easing.type: Animations.s_accel
                    duration: Animations.d_short
                }
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12
                Text {
                    text: ""
                    font.pixelSize: 20
                    color: Colors.on_surface
                }
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    anchors.margins: 12
                    spacing: 6

                    RowLayout {
                        Layout.fillWidth: true

                        Text {
                            text: "Brightness"
                            font.pixelSize: 14
                            color: Colors.on_surface
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                        Text {
                            text: root.brightness
                            font.pixelSize: 14
                            color: Colors.on_surface
                        }
                    }
                    Rectangle {
                        implicitHeight: 6
                        implicitWidth: 125
                        radius: 6
                        color: Colors.surface_container_high
                        Rectangle {
                            radius: parent.height
                            implicitHeight: parent.height
                            implicitWidth: Math.max(0, Math.min(root.brightness, 100)) * parent.width / 100
                            color: Colors.primary
                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: Animation.d_short
                                    easing.type: Animation.s_accel
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}
