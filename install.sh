#!/bin/bash
                        mount -o remount,rw /
                        user=$(whoami)
                        configuser=$(ls /home | head -1)
                        brightness=$(xrandr | grep " connected" | cut -f1 -d " ")
                        area51="/usr/bin"
                        name="auto"
                        if [ $user == "root" ]; then
                          clear
                          echo -e "\e[31mWe're starting up"
                          sleep 1
                        else
                          clear
                          echo -e "\e[31mYou must run this as root"
                          sleep 1.5
                          exit
                        fi

                        echo -e "We're setting up all modules and drivers we need"
                        apt-get -y install dconf-tools
			apt-get -y install cpufrequtils 
                        apt-get -y install git 
                        dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature 5500
			sleep 1.3
                        echo "Downloading project"
                        wget -P /home/$configuser/Pictures/ https://www.hdwallpapers.in/download/macos_sierra_mountains_5k-wide.jpg
                        gsettings set org.gnome.desktop.background picture-uri file:///home/$configuser/Pictures/macos_sierra_mountains_5k-wide.jpg
			git clone https://github.com/v0nHoFF/auto.git
                        sleep 0.2
                        cd auto/
                        chmod +x auto.sh
                        cp auto.sh $area51
                        cp auto.sh.desktop /home/$configuser/.config/autostart/
                        clear
                        echo "Finished. If you want to know how this script works, check the github README sector."
