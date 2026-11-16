import QtQuick
import Quickshell
import Quickshell.Io
import qs.theme

Rectangle {
    id: root

    property string status: "Stopped"
    property string artist: ""
    property string title: ""
    property int maxTextWidth: 240

    readonly property bool active: status !== "Stopped" && title !== ""
    readonly property color palabras: Theme.statColorsText.music

    // Sin reproductor activo, el módulo desaparece
    visible: active
    implicitWidth: row.implicitWidth + 16
    implicitHeight: 20
    radius: 4
    color: Theme.statColors.music

    // Escucha cambios de estado y metadatos de playerctl
    Process {
        running: true
        command: ["playerctl", "--follow", "metadata", "--format",
                  "{{status}}\t{{artist}}\t{{title}}"]

        stdout: SplitParser {
            onRead: line => {
                const p = line.split("\t")
                root.status = p[0] ?? "Stopped"
                root.artist = p[1] ?? ""
                root.title = p[2] ?? ""
            }
        }
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 8

        Text {
            text: "󰒮"
            color: root.palabras
            MouseArea {
                anchors.fill: parent
                onClicked: Quickshell.execDetached(["playerctl", "previous"])
            }
        }

        Text {
            text: root.status === "Playing" ? "󰏤" : "󰐊"
            color: root.palabras
            MouseArea {
                anchors.fill: parent
                onClicked: Quickshell.execDetached(["playerctl", "play-pause"])
            }
        }

        Text {
            text: "󰒭"
            color: root.palabras
            MouseArea {
                anchors.fill: parent
                onClicked: Quickshell.execDetached(["playerctl", "next"])
            }
        }

        Text {
            width: Math.min(implicitWidth, root.maxTextWidth)
            elide: Text.ElideRight
            color: root.palabras
            text: root.artist !== "" ? root.artist + " - " + root.title : root.title
        }
    }
}
