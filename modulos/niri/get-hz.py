import json
import subprocess


def current_hz():
    focused = json.loads(
        subprocess.check_output(["niri", "msg", "--json", "focused-output"])
    )
    outputs = json.loads(
        subprocess.check_output(["niri", "msg", "--json", "outputs"])
    )
    data = outputs[focused["name"]]
    mode = data["modes"][data["current_mode"]]
    return mode["refresh_rate"] / 1000.0


print(f"{current_hz():.0f}")
