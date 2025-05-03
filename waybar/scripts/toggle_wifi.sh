#!/bin/bash

nmcli radio wifi | grep -q enabled && nmcli radio wifi off || nmcli radio wifi on

