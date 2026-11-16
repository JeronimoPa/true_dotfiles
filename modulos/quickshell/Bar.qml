// Bar.qml
import Quickshell
import QtQuick
Scope {
	// no more time object

	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData
			color: "transparent"
			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30
			
			Row {
				anchors.left: parent.left
				anchors.leftMargin: 10
				anchors.verticalCenter: parent.verticalCenter
				spacing: 12

				// reserva el ancho de 5 workspaces aunque haya menos
				Item {
					implicitWidth: workspaces.maxWidth
					implicitHeight: workspaces.implicitHeight

					WorkspaceWidget {
						id: workspaces
						output: modelData.name
					}
				}

				TrayWidget {}
				MusicPlayer {}
			}
			Row {
				anchors.right: parent.right
				anchors.rightMargin: 10
				anchors.verticalCenter: parent.verticalCenter
				spacing: 6
				
				Volume {}
				ClockWidget {}
				StatWidget { kind: "cpu";label: ""; value: SystemStats.cpu }
				StatWidget { kind: "ram";label: ""; value: SystemStats.ram }
				StatWidget { kind: "gpu";label: "󰖺"; value: SystemStats.gpu }
				BatteryWidget {}
			}
		}
	}
}
