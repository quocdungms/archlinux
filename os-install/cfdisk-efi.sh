#!bin/bash

#boot volume
bootDIR="sda1"

#home volume
homeDIR="sda2"

#swap volume
#swapDIR="sdx"

mkfs.fat -F32 /dev/$bootDIR
mkfs.ext4 /dev/$homeDIR

#mkswap /dev/$swapDIR
#swapon /dev/$swapDIR


mount /dev/$homeDIR /mnt
mkdir /mnt/home /mnt/boot
mount /dev/$bootDIR /mnt/boot

#======================================================
pacstrap /mnt base base-devel linux linux-firmware linux-headers git nano
genfstab -U /mnt >> /mnt/etc/fstab

cp -r ~/archlinux /mnt
arch-chroot /mnt
