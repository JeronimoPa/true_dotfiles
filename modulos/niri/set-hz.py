import json
import subprocess
import sys

if len(sys.argv) < 2:
    sys.exit("Uso: set-hz <hz_aproximados>")

target_hz = float(sys.argv[1])

focused = json.loads(
    subprocess.check_output(["niri", "msg", "--json", "focused-output"])
    )
outputs = json.loads(
    subprocess.check_output(["niri", "msg", "--json", "outputs"])
    )

out_name = focused["name"]
out_data = outputs[out_name]

curr_idx = out_data.get("current_mode", 0)
curr_mode = out_data["modes"][curr_idx]
w, h = curr_mode["width"], curr_mode["height"]

same_res = [
    m for m in out_data["modes"] if m["width"] == w and m["height"] == h
    ]
best = min(
    same_res, key=lambda m: abs((m["refresh_rate"] / 1000.0) - target_hz)
    )

exact_hz = f"{best['refresh_rate'] / 1000.0:.3f}"
subprocess.run(
    ["niri", "msg", "output", out_name, "mode", f"{w}x{h}@{exact_hz}"]
    )
