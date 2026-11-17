import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.components
import qs.theme

StatWidget {
    id: root

    readonly property var sink: Pipewire.defaultAudioSink
    readonly property bool muted: sink?.audio?.muted ?? false
    readonly property var sinks: Pipewire.nodes.values.filter(n => n.isSink && !n.isStream && n.audio)
	readonly property string icon: {
		if (muted /*|| value === 0*/) return "󰝟"   // mute
		if (value < 34) return "󰕿"             // bajo
		if (value < 67) return "󰖀"             // medio
		return "󰕾"                             // alto
	}
    PwObjectTracker {
        objects: [root.sink]
    }

    kind: "volume"
    label: ""
    value: (sink?.audio?.volume ?? 0) * 100
	display: icon 
	reserve: "󰕾"


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton) {
                menu.open = !menu.open
            } else if (root.sink?.audio) {
                root.sink.audio.muted = !root.sink.audio.muted
            }
        }

        onWheel: wheel => {
            const audio = root.sink?.audio
            if (!audio) return
            const step = wheel.angleDelta.y > 0 ? 0.05 : -0.05
            audio.volume = Math.max(0, Math.min(1, audio.volume + step))
        }
    }

    PopupWindow {
        id: menu

        property bool open: false
        // Hueco transparente entre el widget y el menú
        readonly property int gap: 10

        // Sigue visible mientras dura la animación de salida
        visible: open || panel.opacity > 0
        color: "transparent"

        anchor.item: root
        anchor.edges: Edges.Bottom
        anchor.gravity: Edges.Bottom

        implicitWidth: Math.max(root.width, list.implicitWidth + 16)
        implicitHeight: list.implicitHeight + 8 + gap + 8

        Rectangle {
            id: panel

            width: parent.width
            height: list.implicitHeight + 8
            radius: 4
            color: Theme.statColors.volume

            // Desliza hacia abajo y aparece con fundido
            y: menu.open ? menu.gap : menu.gap - 8
            opacity: menu.open ? 1 : 0

            Behavior on y {
                NumberAnimation { duration: 160; easing.type: Easing.OutCubic }
            }
            Behavior on opacity {
                NumberAnimation { duration: 140; easing.type: Easing.OutQuad }
            }

            Column {
                id: list
                anchors.centerIn: parent
                spacing: 2

                Repeater {
                    model: root.sinks

                    delegate: Rectangle {
                        required property var modelData
                        readonly property bool current: modelData.id === root.sink?.id

                        width: Math.max(label.implicitWidth + 16, panel.width - 16)
                        height: 22
                        radius: 3
                        color: hover.containsMouse ? "#40000000" : "transparent"

                        Behavior on color {
                            ColorAnimation { duration: 120 }
                        }

                        Text {
                            id: label
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 8
                            color: "#000000"
                            font.bold: parent.current
                            text: (parent.current ? "● " : "  ") + (modelData.description || modelData.nickname || modelData.name)
                        }

                        MouseArea {
                            id: hover
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                Pipewire.preferredDefaultAudioSink = modelData
                                menu.open = false
                            }
                        }
                    }
                }
            }
        }
    }
}
