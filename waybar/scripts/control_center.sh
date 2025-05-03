#!/bin/bash

wifi_icon=""
bluetooth_icon=""
perf_icon=""

# Verifica Wi-Fi
wifi_enabled=$(nmcli radio wifi)
wifi_status=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ':wifi:connected')
wifi_label="$wifi_icon"
[[ -n "$wifi_status" ]] && wifi_label="${wifi_icon} On" || {
    [[ "$wifi_enabled" == "enabled" ]] && wifi_label="${wifi_icon} Off" || wifi_label="${wifi_icon} ✕"
}

# Verifica Bluetooth
bt_status=$(bluetoothctl show | grep "Powered: yes")
bt_connected=$(bluetoothctl info | grep "Connected: yes")
if [[ -n "$bt_status" ]]; then
    bt_label="${bluetooth_icon} On"
    [[ -n "$bt_connected" ]] && bt_label="${bluetooth_icon} ✓"
else
    bt_label="${bluetooth_icon} ✕"
fi

# Verifica perfil de energia
profile=$(powerprofilesctl get)
case "$profile" in
    performance) profile_icon="";;
    balanced) profile_icon="";;
    power-saver) profile_icon="";;
esac

echo "$wifi_label | $bt_label | $profile_icon"

