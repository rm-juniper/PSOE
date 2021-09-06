#!/bin/bash
sudo mkdir /usr/share/backgrounds
sudo cp ../img/default_linux.png /usr/share/backgrounds/
#Install Configs
cp -rf ../cfg/dunst ~/.config/
cp -rf ../cfg/picom.conf ~/.config/
cp ../cfg/Xresources ~/.Xresources
cp ../cfg/xinitrc ~/.xinitrc
cp -rf ../cfg/nitrogen ~/.config/

#Install PSOE
cp -rf ../bin ~/.local/
cd ../src/dwm && sudo make clean install && rm -f config.h && cd ..
cd dwmblocks && sudo make clean install && rm -f blocks.h && cd ..
cd dmenu && sudo make clean install && rm -f config.h && cd ..
cd st && sudo make clean install && rm -f config.h && cd ..
cd slock && sudo make clean install && rm -f config.h && cd ..
cd xmenu && sudo make clean install && cd ..
cd ly && sudo make clean install && sudo systemctl enable ly && cd ../..
