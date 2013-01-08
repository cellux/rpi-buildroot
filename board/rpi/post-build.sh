TARGETDIR=$1
BR_ROOT=$PWD

# copy kernel image to /boot
install -T -m 0644 $BR_ROOT/output/images/zImage $BR_ROOT/output/staging/boot/kernel.img

# create boot.tar.gz
tar -C $BR_ROOT/output/staging/boot -cvzf $BR_ROOT/output/images/bootfs.tar.gz --owner 0 --group 0 .

# set root password to `passpass'
sed -i -e 's#^root:.*:#root:paTMTLhmeVJck:#' $TARGETDIR/etc/shadow

# mount /boot
echo '/dev/mmcblk0p1 /boot vfat defaults 0 0' >> $TARGETDIR/etc/fstab

# remove leftover junk
rm -rf $TARGETDIR/usr/build-1

