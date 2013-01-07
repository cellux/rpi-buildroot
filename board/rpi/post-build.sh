TARGETDIR=$1
BR_ROOT=$PWD

# create (temporary) directory for /boot
mkdir -p $TARGETDIR/boot

# copy boot files from firmware
for f in bootcode.bin fixup.dat start.elf; do
  install -m 0644 $BR_ROOT/output/build/rpi-firmware-*/boot/$f $TARGETDIR/boot
done

# create kernel image in the format required by the Pi boot loader
( cd $BR_ROOT/output/build/rpi-tools-*/mkimage
  python imagetool-uncompressed.py $BR_ROOT/output/images/zImage
  mv kernel.img $TARGETDIR/boot
)

# copy default config.txt
cp $BR_ROOT/output/build/rpi-config-*/config.txt $TARGETDIR/boot

# copy default command line
cp $BR_ROOT/board/rpi/cmdline.txt $TARGETDIR/boot

# create boot.tar.gz
tar -C $TARGETDIR/boot -cvzf $BR_ROOT/output/images/bootfs.tar.gz .

# remove /boot from target
rm -rf $TARGETDIR/boot

# set root password to `passpass'
sed -i -e 's#^root:.*:#root:paTMTLhmeVJck:#' $TARGETDIR/etc/shadow

# mount /boot
echo '/dev/mmcblk0p1 /boot vfat defaults 0 0' >> $TARGETDIR/etc/fstab

# remove leftover junk
rm -rf $TARGETDIR/usr/build-1

