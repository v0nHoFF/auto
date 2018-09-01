while true
 do
	state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep state| awk '{print$
        if [ $state == "fully-charged" ]
        then
         echo "setting to performance"
         cpufreq-set -r -g performance
        elif [ $state == "charging" ]
        then
         echo "charging setted to performance"
         cpufreq-set -r -g performance
        elif [ $state == "discharging" ]
        then
         echo "setting to powersaving"
         cpufreq-set -r -g powersave
        else
         echo "None of the condition met"
        fi
done
