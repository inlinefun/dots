// Generated with matugen

import QtQuick
import Quickshell

pragma Singleton

Singleton {
    <* for name, value in colors *>
    property color {{name}}: "{{value.default.hex}}"
    <* endfor *>
}
