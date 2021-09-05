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
function packages_arch(){
	clear
	sudo pacman -Syu git xorg xorg-xinit xorg-xprop curl dunst neofetch htop gvfs gvfs-smb samba sshfs openssh network-manager-applet acpilight xautolock xfce4-screenshooter freetype2 libx11 libxft libxinerama glib2 gcr webkit2gtk ca-certificates nitrogen lxappearance picom tamsyn-font terminus-font dina-font gnu-free-fonts noto-fonts ttf-bitstream-vera ttf-dejavu noto-fonts-emoji adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont ttf-hanazono ttf-sazanami imlib2 ttf-font-awesome pcmanfm pamixer
}

function packages_ubuntu(){
	clear
	sudo pacman -Syu git xorg xinit xorg-xprop curl dunst neofetch htop gvfs gvfs-smb samba sshfs openssh network-manager-applet acpilight xautolock xfce4-screenshooter freetype2 libx11 libxft libxinerama glib2 gcr webkit2gtk ca-certificates nitrogen lxappearance picom tamsyn-font terminus-font dina-font gnu-free-fonts noto-fonts ttf-bitstream-vera ttf-dejavu noto-fonts-emoji adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont ttf-hanazono ttf-sazanami 
}

function packages_debian(){
	clear
	sudo apt update && sudo apt install git xorg xinit x11-utils dunst neofetch htop gvfs gvfs-backends samba sshfs openssh network-manager-gnome xautolock xfce4-screenshooter libfreetype-dev libx11-dev libxft-dev libxinerama-dev libglib2.0-dev gcr libwebkit2gtk-4.0-dev ca-certificates nitrogen lxappearance fonts-noto ttf-bitstream-vera fonts-noto-color-emoji fonts-hanazono
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
'Arch Linux' "Install for Arch Linux." \
Ubuntu "Install for Ubuntu Linux." \
Debian "Install for Debian Linux." \
Back "Back to Main Menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion 
case $menuitem in
	'Arch Linux') packages_arch;;
	Ubuntu) packages_ubuntu;;
	Debian) packages_debian;;
	Back) echo "Bye"; break;;
esac

done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
