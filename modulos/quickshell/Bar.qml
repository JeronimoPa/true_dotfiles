// Bar.qml
import Quickshell

Scope {
	// no more time object

	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30
			
			WorkspaceWidget {
				output: modelData.name
				anchors.left: parent.left
				anchors.leftMargin: 10
				anchors.verticalCenter: parent.verticalCenter
			}
			TrayWidget {
				anchors.right: parent.right
				anchors.rightMargin: 10
				anchors.verticalCenter: parent.verticalCenter
			}
			ClockWidget {
				anchors.centerIn: parent

				// no more time binding
			}
		}
	}
}
