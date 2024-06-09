#!bin/bash

#boot volume name
bDIR="nvme0n1p6"

#home volume name
hDIR="nvme0n1p7"

mkfs.fat -F32 /dev/$bDIR
mkfs.ext4 /dev/$hDIR

mount /dev/$hDIR /mnt
mkdir /mnt/home /mnt/boot
mount /dev/$bDIR /mnt/boot

#======================================================
pacstrap /mnt base base-devel linux linux-firmware linux-headers git nano
genfstab -U /mnt >> /mnt/etc/fstab

cp -r ~/archlinux /mnt
arch-chroot /mnt
