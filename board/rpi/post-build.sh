TARGETDIR=$1
BR_ROOT=$PWD

# set root password to `passpass'
install -T -m 0600 $BR_ROOT/system/skeleton/etc/shadow $TARGETDIR/etc/shadow
sed -i -e 's#^root:[^:]*:#root:paTMTLhmeVJck:#' $TARGETDIR/etc/shadow

# create an empty /boot directory in target
install -d -m 0755 $TARGETDIR/boot

# setup mount for /boot
install -T -m 0644 $BR_ROOT/system/skeleton/etc/fstab $TARGETDIR/etc/fstab
echo '/dev/mmcblk0p1 /boot vfat defaults 0 0' >> $TARGETDIR/etc/fstab

# link /etc/resolv.conf to /proc/net/pnp
rm -f $TARGETDIR/etc/resolv.conf
ln -s /proc/net/pnp $TARGETDIR/etc/resolv.conf
