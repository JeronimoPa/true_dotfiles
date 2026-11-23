#!/usr/bin/env bash
CFG="$HOME/.config/niri/config.kdl"

if grep -q '^\s*off // TPOFF' "$CFG"; then
    sed -i --follow-symlinks 's|^\(\s*\)off // TPOFF|\1// TPOFF|' "$CFG"
    notify-send "Touchpad activado"
else
    sed -i --follow-symlinks 's|^\(\s*\)// TPOFF|\1off // TPOFF|' "$CFG"
    notify-send "Touchpad desactivado"
fi
