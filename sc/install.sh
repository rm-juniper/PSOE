#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

#
# Purpose - display output using msgbox 
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "Linux Shell Script Tutorial" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}
#
# Purpose - display current system date & time
#
function install(){
	clear
	cd sc
	./configs.sh
}

#
# set infinite loop
#
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Patty's Standard Operating Environment" \
--title "Select a Distribution to install for" \
--menu "This will install all of the required\n\
packages for Pizzadesk/PSOE to operate correctly. \n\
" 15 50 4 \
'Install' "Install PSOE." \
Back "Back to Main Menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion 
case $menuitem in
	Install) install;;
	Back) echo "Bye"; break;;
esac

done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT


#!/bin/bash

