pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root
    readonly property int outerMargin: 5
    readonly property int barHeight: 50
    readonly property int radius: 5
    readonly property int transitionDuration: 150
    readonly property var transitionEasing: Easing.OutSine
}
