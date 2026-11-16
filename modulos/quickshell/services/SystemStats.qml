// SystemStats.qml
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root

	// todos en porcentaje, 0-100
	property real cpu: 0
	property real ram: 0
	property real gpu: 0

	property var _lastCpu: null

	Timer {
		interval: 2000
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: {
			statFile.reload();
			memFile.reload();
			if (!gpuProc.running) gpuProc.running = true;
		}
	}

	// CPU: se calcula con la diferencia entre dos lecturas de /proc/stat
	FileView {
		id: statFile
		path: "/proc/stat"
		onLoaded: {
			const line = text().split("\n")[0];
			const n = line.trim().split(/\s+/).slice(1).map(Number);
			const idle = n[3] + n[4];
			const total = n.slice(0, 8).reduce((a, b) => a + b, 0);

			if (root._lastCpu) {
				const dTotal = total - root._lastCpu.total;
				const dIdle = idle - root._lastCpu.idle;
				if (dTotal > 0) root.cpu = 100 * (1 - dIdle / dTotal);
			}
			root._lastCpu = { idle: idle, total: total };
		}
	}

	// RAM: usada = total - disponible
	FileView {
		id: memFile
		path: "/proc/meminfo"
		onLoaded: {
			const t = text();
			const total = Number(t.match(/MemTotal:\s+(\d+)/)[1]);
			const avail = Number(t.match(/MemAvailable:\s+(\d+)/)[1]);
			root.ram = 100 * (1 - avail / total);
		}
	}

	// GPU: prueba AMD (sysfs) y si no existe, NVIDIA (nvidia-smi)
	Process {
		id: gpuProc
		command: ["sh", "-c",
			"f=$(ls /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -n1); " +
			"if [ -n \"$f\" ]; then cat \"$f\"; " +
			"else nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1; fi"
		]

		stdout: StdioCollector {
			onStreamFinished: {
				const v = parseFloat(text);
				if (!isNaN(v)) root.gpu = v;
			}
		}
	}
}
