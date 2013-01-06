TARGETDIR=$1

# set root password to `passpass'
sed -i -e 's#^root:.*:#root:paTMTLhmeVJck:#' $TARGETDIR/etc/shadow

# mount /boot
echo '/dev/mmcblk0p1 /boot vfat defaults 0 0' >> $TARGETDIR/etc/fstab

