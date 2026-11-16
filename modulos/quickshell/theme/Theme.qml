// Theme.qml
pragma Singleton

import QtQuick
import Quickshell

Singleton {
	// fondo de un recuadro normal (workspace con ventanas, icono del tray)
	property color surface: "#313244"
	// workspace activo en otro monitor, y hover en el tray
	property color surfaceHover: "#585b70"
	// workspace enfocado
	property color accent: "#89b4fa"
	// texto
	property color text: "white"
	// texto secundario (etiquetas)
	property color textMuted: "#a6adc8"
	
	property color warning: "#f38ba8"

	property var statColors: ({
		volume:		"#fabd2f",
		music:      "#8ec07c",
		clock:		"#cc241d",
		cpu:		"#b8bb26",
		ram:		"#fe8019",
		gpu:		"#d3869b",
		battery:	"#458588"
	})
	property var statColorsText: ({
		volume:		"#000000",
		music:		"#000000",
		cpu:        "#282828",
		ram:        "#282828",
		gpu:        "#282828",
		battery:    "#000000",
		clock:      "#fbf1c7"
	})
}
