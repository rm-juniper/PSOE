#!/bin/bash
cd dwm && sudo make clean install && rm -f config.h && cd .. &&
cd dwmblocks && sudo make clean install && rm -f blocks.h && cd .. &&
cd dmenu && sudo make clean install && rm -f config.h && cd .. &&
cd slock && sudo make clean install && rm -f config.h && cd .. &&
cd st && sudo make clean install && rm -f config.h && cd ..
