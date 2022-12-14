#!/bin/bash

iconpath="/usr/share/icons/Papirus-Dark/24x24/panel/"
#iconpath="$HOME/.config/tint2/executors/icons/battery/"

status=$(cat /sys/class/power_supply/BAT0/status)
perc=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ $status = "Discharging" ]]; then
	if [[ $perc -ge 91 ]]; then
		echo "${iconpath}battery-full.svg"
		echo "$perc% "
	elif [[ $perc -ge 71 ]]; then
		echo "${iconpath}battery-good.svg"
		echo "$perc% "
		elif [[ $perc -ge 51 ]]; then
			echo "${iconpath}battery-medium.svg"
			echo "$perc% "
			elif [[ $perc -ge 31 ]]; then
				echo "${iconpath}battery-low.svg"
				echo "$perc% "
				elif [[ $perc -ge 16 ]]; then
					echo "${iconpath}battery-caution.svg"
					echo "$perc% "
					elif [[ $perc -ge 1 ]]; then
						echo "${iconpath}battery-empty.svg"
						echo "$perc% "
	fi

elif [[ $status = "Charging" ]]; then
	if [[ $perc -ge 90 ]]; then
		echo "${iconpath}battery-full-charging.svg"
		echo "$perc% "
	elif [[ $perc -ge 70 ]]; then
		echo "${iconpath}battery-good-charging.svg"
		echo "$perc% "
		elif [[ $perc -ge 50 ]]; then
			echo "${iconpath}battery-medium-charging.svg"
			echo "$perc% "
			elif [[ $perc -ge 30 ]]; then
				echo "${iconpath}battery-low-charging.svg"
				echo "$perc% "
				elif [[ $perc -ge 15 ]]; then
					echo "${iconpath}battery-caution-charging.svg"
					echo "$perc% "
					elif [[ $perc -ge 1 ]]; then
						echo "${iconpath}battery-empty-charging.svg"
						echo "$perc% "		
	fi

else
	echo "${iconpath}battery-full-charged.svg"
	echo "$perc% "
fi
