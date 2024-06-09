#!/bin/sh

case $1 in
	status)
		if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
		then
			echo "%{F#969493}"
		else
			if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
			then 
				echo " On"
			fi
			echo "%{F#ffffff}"
		fi
		;;
	toggle)
		if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
		then
			bluetoothctl power on
		else
			bluetoothctl power off
		fi
		;;
esac
