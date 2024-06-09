#!bin/bash
sudo pacman -S reflector --noconfirm
continent=Asia
country=Vietnam
city=Ho_Chi_Minh

ln -sf /usr/share/zoneinfo/$continent/$city /etc/localtime
hwclock --systohc
reflector -c $country -a 12 --sort rate --save /etc/pacman.d/mirrorlist
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo arch >> /etc/hostname
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost" >> /etc/hosts
echo "127.0.1.1    arch.localdomain    arch" >> /etc/hosts
echo 'root:1' | chpasswd
useradd -m kevin
echo 'kevin:1' | chpasswd
usermod -aG wheel,audio,video,optical,storage,power kevin
echo "kevin ALL=(ALL) ALL" >> /etc/sudoers.d/kevin

pacman -S grub efibootmgr networkmanager network-manager-applet --noconfirm
systemctl enable NetworkManager
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

printf "\e[1;32m========================================\nNOTICE:\nAll Done! Type \"exit\", \"umount -R /mnt\" and reboot.\nType \"sudo nmtui\" to connect wifi after reboot.\n\e[0m"
