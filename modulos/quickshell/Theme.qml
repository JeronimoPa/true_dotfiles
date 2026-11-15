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
}
