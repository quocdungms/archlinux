#!/usr/bin/env bash

# Edit your user password here
userPassword=1

# Define
install="sudo pacman -S --noconfirm"
yay_intsall="yay -S --noconfirm"

# Update system
echo $userPassword | sudo -S pacman -Syyu --noconfirm

# install bspwm + sxhkd
$install bspwm sxhkd xorg xorg-xinit xorg-server arandr git nano alacritty dmenu


mkdir $HOME/.config
mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
mkdir $HOME/Pictures
cp -r $PWD/wallpaper $HOME/Pictures
cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc $HOME/.config/sxhkd/
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc

# cp -r $PWD/dotfile/.config $HOME
# cp $PWD/dotfile/.xinitrc $HOME
# cp $PWD/dotfile/.config/sxhkd/sxhkdrc $HOME/.config/sxhkd
# cp $PWD/dotfile/.config/bspwm/bspwmrc $HOME/.config/bspwm



 # install neovim pulgin
$install nodejs npm python-pynvim
cd $HOME
sudo npm install neovim 

#--install vim-lpug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install grub-themes
