import QtQuick

import qs.common

Text {
    id: root
    property string fontFamily: Config.font
    property int size: 13
    property bool bold: false
    property bool italic: false
    property bool underlined: false
    property bool strikethrough: false

    color: Colors.on_surface
    font {
        bold: root.bold
        italic: root.italic
        family: root.fontFamily
        pointSize: root.size
        underline: root.underlined
        strikeout: root.strikethrough
    }
}
