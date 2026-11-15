// TrayWidget.qml
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Row {
	id: root

	spacing: 6

	Repeater {
		model: SystemTray.items

		Rectangle {
			id: box
			required property SystemTrayItem modelData

			implicitWidth: 24
			implicitHeight: 20
			radius: 4
			color: area.containsMouse ? Theme.surfaceHover : Theme.surface

			IconImage {
				anchors.centerIn: parent
				implicitSize: 14
				source: box.modelData.icon
			}

			MouseArea {
				id: area
				anchors.fill: parent
				acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
				hoverEnabled: true

				onClicked: event => {
					if (event.button === Qt.LeftButton) {
						box.modelData.activate();
					} else if (event.button === Qt.MiddleButton) {
						box.modelData.secondaryActivate();
					} else if (box.modelData.hasMenu) {
						menu.open();
					}
				}
			}

			QsMenuAnchor {
				id: menu
				menu: box.modelData.menu
				anchor.item: box
				anchor.edges: Edges.Bottom
				anchor.gravity: Edges.Bottom
			}
		}
	}
}
