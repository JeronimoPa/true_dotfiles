// StatWidget.qml
import QtQuick
import qs.theme

Rectangle {
	id: root

	property string label: ""
	property real value: 0
	property string kind: ""

	// texto que se muestra; por defecto, el valor en porcentaje
	property string display: Math.round(value) + "%"

	// texto de referencia para reservar el ancho y que el recuadro no se mueva
	property string reserve: "100%"

	readonly property color tint:		Theme.statColors[kind] ?? Theme.accent
	readonly property color palabras:	Theme.statColorsText[kind] ?? Theme.accent

	implicitWidth: row.implicitWidth + 16
	implicitHeight: 20
	radius: 4
	color: tint
	TextMetrics {
		id: metrics
		text: root.reserve
	}

	Row {
		id: row
		anchors.centerIn: parent
		spacing: 6

		Text {
			text: root.label
			color: palabras
		}

		Text {
			id: valueText
			width: Math.max(metrics.width, implicitWidth)
			horizontalAlignment: Text.AlignRight
			text: root.display
			color: palabras
		}
	}
}
