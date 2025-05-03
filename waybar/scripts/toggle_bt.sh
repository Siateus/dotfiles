#!/bin/bash

# ~/.config/waybar/scripts/toggle_bt.sh
bluetoothctl show | grep -q "Powered: yes" && bluetoothctl power off || bluetoothctl power on

