pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // an expression can be broken across multiple lines using {}
  readonly property string time: {
    // The passed format string matches the default output of
    // the `date` command.
		const s = clock.date.toLocaleString(Qt.locale("es_ES"), "ddd d HH:mm");
		// Qt devuelve "lun" en minúscula; se pone la primera en mayúscula
		return s.charAt(0).toUpperCase() + s.slice(1);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
