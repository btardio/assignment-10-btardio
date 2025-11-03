# Notes:

docker run -it --network=host -v /var/run/docker.sock:/var/run/docker.sock -u bitbake -v ./:/repo classimg /bin/bash

after moving .config to the buildroot use

make BR2_EXTERNAL=/repo/ext-tree/


### Generate root password for BR2_TARGET_GENERIC_ROOT_PASSWD

openssl passwd -6 -salt $(openssl rand -base64 12) root



other idea is squashfs


console=ttyS0,115200 console=tty1 initramfs initramf.gz followkernel root=/dev/ram0 rw rootfstype=ext4

console=ttyS0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait initrd=initramfs-raspi5.img

console=tty1 root=/dev/ram0 init=/sbin/init rootfstype=squashfs rootwait rw


 0x80000       0x? (size of kernel)          0x? (size of kernel + squashfs)

kernel   ->    squashfs                ->       ram



tool to find offset: binwalk



other cmdline.txt properties:

load_ramdisk
ramdisk_start


what is cmdline.txt?


In essence, cmdline.txt provides a direct mechanism to configure kernel boot parameters in systems that don't utilize a traditional GRUB bootloader, achieving the same outcome as adding parameters to the linux line within a GRUB configuration.


mount -t squashfs -o loop ./rootfs.squashfs /mnt/squashfs/
