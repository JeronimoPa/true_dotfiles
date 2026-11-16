// Niri.qml
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root

	property var workspaces: []

	// solo workspaces con ventanas, más el activo de cada monitor
	function forOutput(name) {
		return workspaces
		.filter(w => w.output === name)
		.filter(w => w.active_window_id !== null || w.is_active)
		.filter(w => w.idx <= 5)
		.sort((a, b) => a.idx - b.idx);
	}

	function focusWorkspace(idx) {
		Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", String(idx)]);
	}

	Process {
		running: true
		command: ["niri", "msg", "--json", "event-stream"]

		onExited: (code, status) => console.log("niri event-stream terminó:", code, status)

		stderr: SplitParser {
			onRead: data => console.log("niri stderr:", data)
		}

		stdout: SplitParser {
			onRead: data => {
			//console.log("niri evento:", data.substring(0, 120));
				let ev;
				try { ev = JSON.parse(data); } catch (e) { return; }

				if (ev.WorkspacesChanged) {
					root.workspaces = ev.WorkspacesChanged.workspaces;
				} else if (ev.WorkspaceActivated) {
					const act = ev.WorkspaceActivated; // { id, focused }
					const target = root.workspaces.find(w => w.id === act.id);
					if (!target) return;

					root.workspaces = root.workspaces.map(w => {
						const copy = Object.assign({}, w);
						if (w.output === target.output)
							copy.is_active = (w.id === act.id);
						if (act.focused)
							copy.is_focused = (w.id === act.id);
						return copy;
					});
				} else if (ev.WorkspaceActiveWindowChanged) {
					const c = ev.WorkspaceActiveWindowChanged; // { workspace_id, active_window_id }
					root.workspaces = root.workspaces.map(w => {
						if (w.id !== c.workspace_id) return w;
						const copy = Object.assign({}, w);
						copy.active_window_id = c.active_window_id;
						return copy;
					});
				}
			}
		}
	}
}
