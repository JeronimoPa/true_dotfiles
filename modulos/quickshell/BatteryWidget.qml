// BatteryWidget.qml
import Quickshell.Services.UPower

StatWidget {
	readonly property var dev: UPower.displayDevice
	readonly property bool charging: dev.state === UPowerDeviceState.Charging
		|| dev.state === UPowerDeviceState.FullyCharged
	readonly property bool low: value <= 25 && !charging
	readonly property bool mid: value <= 80 && !charging && !low

	// solo existe si hay una batería de portátil presente
	visible: dev.isLaptopBattery && dev.isPresent

	kind: "battery"

	label: charging ? "󰂄" : mid ? "󰁾": low ? "󰁻" : "󰁹"
	value: dev.percentage * 100

	// aquí lo alto es bueno, así que se invierte la lógica de color
	//valueColor: Theme.text
}
