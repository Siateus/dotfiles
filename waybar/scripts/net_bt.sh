#!/bin/bash

wifi_icon=""
bluetooth_icon=""

# Descobre interface Wi-Fi conectada
wifi_dev=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ':wifi:connected' | cut -d':' -f1)

if [[ -n "$wifi_dev" ]]; then
    ssid=$(nmcli -t -f GENERAL.CONNECTION dev show "$wifi_dev" | cut -d':' -f2 | xargs)
    signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\*' | cut -d':' -f2 | xargs)

    if [[ -n "$ssid" ]]; then
        wifi_output="$wifi_icon (${signal}%)"
    else
        wifi_output="$wifi_icon Connected"
    fi
else
    wifi_status=$(nmcli radio wifi)
    if [[ "$wifi_status" == "enabled" ]]; then
        wifi_output="$wifi_icon Disconnected"
    else
        wifi_output="$wifi_icon Off"
    fi
fi

# Bluetooth status
bt_powered=$(bluetoothctl show | grep "Powered: yes")
bt_connected=$(bluetoothctl info | grep "Connected: yes")

if [[ -n "$bt_powered" ]]; then
    if [[ -n "$bt_connected" ]]; then
        bt_output="$bluetooth_icon Connected"
    else
        bt_output="$bluetooth_icon On"
    fi
else
    bt_output="$bluetooth_icon Off"
fi

# Resultado final
echo "$wifi_output | $bt_output"
