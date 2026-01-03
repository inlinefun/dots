pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root<* for name, value in colors *>
    readonly property color {{name}}: "{{value.default.hex}}"<* endfor *>
}
