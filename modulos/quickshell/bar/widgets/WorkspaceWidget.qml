// WorkspaceWidget.qml
import QtQuick
import qs.services
import qs.theme

Row {
	id: root

	property string output: ""

	readonly property int cellWidth: 30
	readonly property int maxCount: 5

	// ancho que ocupan 5 workspaces, para reservar el sitio
	readonly property real maxWidth: maxCount * cellWidth + (maxCount - 1) * spacing

	spacing: 6

	function toRoman(n) {
		const map = [
			[1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
			[100, "C"], [90, "XC"], [50, "L"], [40, "XL"],
			[10, "X"], [9, "IX"], [5, "V"], [4, "IV"], [1, "I"]
		];
		let out = "";
		for (const [value, symbol] of map) {
			while (n >= value) {
				out += symbol;
				n -= value;
			}
		}
		return out;
	}

	Repeater {
		model: Niri.forOutput(root.output)

		Rectangle {
			required property var modelData

			implicitWidth: root.cellWidth
			implicitHeight: 20
			radius: 4
			color: modelData.is_focused ? Theme.accent
			: (modelData.is_active || area.containsMouse) ? Theme.surfaceHover
			: Theme.surface

			Text {
				anchors.centerIn: parent
				text: modelData.name ?? root.toRoman(modelData.idx)
				color: Theme.text
			}

			MouseArea {
				id: area
				anchors.fill: parent
				hoverEnabled: true
				onClicked: Niri.focusWorkspace(modelData.idx)
			}
		}
	}
}
