#!/usr/bin/env bash

# Edit your user password here
userPassword=1

# Define
install="sudo pacman -S --noconfirm"
yay_intsall="yay -S --noconfirm"

# Update system
echo $userPassword | sudo -S pacman -Syyu --noconfirm 



# $install yay
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd ..


$install chromium lxappearance rofi dunst polybar neovim nitrogen os-prober
$install picom thunar file-roller arc-gtk-theme mpd ncmpcpp neofetch 

# St packages
$install xdg-user-dirs xdg-utils calc python-pywar 
$yay_intsall networkmanager_dmenu 

# Android phone driver
$install mtpfs gvfs-mtp gvfs-gphoto2
$yay_intsall jmtpfs 

# Windows NTFS dirver
$install ntfs-3g 

# install fonts
$install noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-jetbrains-mono ttf-jetbrains-mono-nerd
$install ttf-ubuntu-font-family ttf-ubuntu-nerd ttf-ubuntu-mono-nerd
$install ttf-iosevka-nerd ttf-fantasque-sans-mono ttf-droid terminus-font
$install ttf-fira-code ttf-firacode-nerd

$yay_intsall ttf-freefont ttf-ms-fonts ttf-linux-libertine ttf-dejavu ttf-inconsolata ttf-icomoon-feather siji-ttf
 
# install audio driver
$install pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-jack pulseaudio-equalizer
$install pulseaudio-lirc pulseaudio-qt pulseaudio-rtp alsa-utils alsa-plugins
# install bluetooth

$install blueberry bluez bluez-utils bluez-tools
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# install some packages
$yay_intsall ibus-bamboo



