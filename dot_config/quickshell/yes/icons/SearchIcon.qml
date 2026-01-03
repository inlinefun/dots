// Generated from SVG file icons/svgs/search.svg
import QtQuick
import QtQuick.Shapes
import QtQuick.VectorImage

import qs.common

Item {
    id: __qt_toplevel
    property int size: 24
    property color color: Colors.on_surface
    implicitWidth: __qt_toplevel.size
    implicitHeight: __qt_toplevel.size
    transform: [
        Scale {
            xScale: __qt_toplevel.width / 24
            yScale: __qt_toplevel.height / 24
        }
    ]
    Shape {
        id: _qt_node0
        preferredRendererType: Shape.CurveRenderer
        ShapePath {
            id: _qt_shapePath_0
            strokeColor: __qt_toplevel.color
            strokeWidth: 2
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            miterLimit: 4
            fillColor: "transparent"
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic
            PathSvg {
                path: "M 21 21 L 16.66 16.66 "
            }
        }
        ShapePath {
            id: _qt_shapePath_1
            strokeColor: __qt_toplevel.color
            strokeWidth: 2
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            miterLimit: 4
            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            pathHints: ShapePath.PathQuadratic | ShapePath.PathNonIntersecting | ShapePath.PathNonOverlappingControlPointTriangles
            PathSvg {
                path: "M 19 11 Q 19 14.3137 16.6569 16.6569 Q 14.3137 19 11 19 Q 7.68629 19 5.34315 16.6569 Q 3 14.3137 3 11 Q 3 7.68629 5.34315 5.34315 Q 7.68629 3 11 3 Q 14.3137 3 16.6569 5.34315 Q 19 7.68629 19 11 "
            }
        }
    }
}
