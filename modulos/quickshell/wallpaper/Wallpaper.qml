// Wallpaper.qml
import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
	id: root

	// cambia esta ruta por la de tu imagen
	property string path: Quickshell.env("HOME") + "/.config/fotos/wallpaper.png"

	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData

			// capa de fondo, por debajo de ventanas y barras
			WlrLayershell.layer: WlrLayer.Background
			WlrLayershell.namespace: "wallpaper"
			exclusionMode: ExclusionMode.Ignore

			anchors {
				top: true
				bottom: true
				left: true
				right: true
			}

			// color mientras carga la imagen (o si no existe)
			color: "black"

			Image {
				anchors.fill: parent
				source: "file://" + root.path
				fillMode: Image.PreserveAspectCrop
				asynchronous: true
				// evita cargar la imagen a más resolución que la pantalla
				sourceSize: Qt.size(parent.width, parent.height)
			}
		}
	}
}
