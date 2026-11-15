// WorkspaceWidget.qml
import QtQuick

Row {
	id: root

	property string output: ""

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

			implicitWidth: Math.max(24, label.implicitWidth + 12)
			implicitHeight: 20
			radius: 4
			color: modelData.is_focused ? Theme.accent
				: modelData.is_active ? Theme.surfaceHover
				: Theme.surface

			Text {
				id: label
				anchors.centerIn: parent
				text: modelData.name ?? root.toRoman(modelData.idx)
				color: Theme.text
			}

			MouseArea {
				anchors.fill: parent
				onClicked: Niri.focusWorkspace(modelData.idx)
			}
		}
	}
}
