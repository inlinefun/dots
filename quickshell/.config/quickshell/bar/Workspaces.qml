import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import "../util"

WrapperMouseArea {
    id: wsroot

    readonly property int minWorkspaces: 5
    readonly property var workspaces: Hyprland.workspaces.values

    Layout.fillHeight: true
    RowLayout {
        anchors {
            centerIn: parent
        }
        Repeater {
            id: wsRepeater
            model: ScriptModel {
                values: {
                    const activeWorkspace = Hyprland.focusedWorkspace
                    const items = [...Hyprland.workspaces.values]
                    while (items.length < minWorkspaces) {
                        items.push({ id: 0})
                    }
                    return items.map((value, index) => {
                        const workspace = workspaces.find((ws) => ws.id == index + 1)
                        return {
                            id: value.id,
                            special: value.name == "special:magic",
                            real: value.id != 0,
                            active: activeWorkspace == value
                        }
                    })
                }
            }
            WrapperMouseArea {
                required property var modelData

                id: ws
                implicitHeight: parent.height * 0.5
                onPressed: Hyprland.dispatch(`workspace ${modelData.id}`)

                Rectangle {
                    color: {
                        if (ws.modelData.special) {
                            return Colors.tertiary
                        } else if (ws.modelData.active) {
                            return Colors.primary
                        } else if (ws.modelData.real) {
                            return Colors.surface_variant
                        } else {
                            return Colors.surface_bright
                        }
                    }
                    radius: parent.height
                    implicitHeight: parent.height
                    implicitWidth: ws.modelData.active ? parent.height * 2 : parent.height
                }
            }
        }
    }
}