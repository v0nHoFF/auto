#!/bin/bash


while true
				do
					H=$(date +%H)
					brightness=$(xrandr | grep " connected" | cut -f1 -d " ")
					state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep state| awk '{print $2}')
				if [ $state == "fully-charged" ]
				then
   					echo "setting to performance"
					cpufreq-set -r -g performance
					if (( 8 <= 10#$H && 10#$H < 18 )); then 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
					        xrandr --output $brightness --brightness 1
					else 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
					        xrandr --output $brightness --brightness 0.6
					fi
				elif [ $state == "charging" ]
				then
   					echo "charging setted to performance"
					cpufreq-set -r -g performance
					if (( 8 <= 10#$H && 10#$H < 18 )); then 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
					        xrandr --output $brightness --brightness 1
					else 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
					        xrandr --output $brightness --brightness 0.6
					fi
				elif [ $state == "discharging" ]
				then
   					echo "setting to powersaving"
					cpufreq-set -r -g powersave
					if (( 8 <= 10#$H && 10#$H < 18 )); then 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
					        xrandr --output $brightness --brightness 0.8
					else 
						gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
					        xrandr --output $brightness --brightness 0.6
					fi
				else
  					echo "None of the condition met"
				fi
			done
