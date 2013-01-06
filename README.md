# Buildroot add-on for building a Raspberry Pi root filesystem

```bash
git clone http://github.com/cellux/rpi-buildroot.git
wget http://buildroot.uclibc.org/downloads/buildroot-2012.11.1.tar.gz
tar xvzf buildroot-2012.11.1.tar.gz
cd buildroot-2012.11.1
ln -s $(readlink -f ../rpi-buildroot/board/rpi) board/rpi
ln -s $(readlink -f ../rpi-buildroot/package/rpi) package/rpi
ln -s $(readlink -f ../rpi-buildroot/package/luajit/luajit-hardfp.patch) package/luajit/luajit-hardfp.patch
cp ../rpi-buildroot/.config .
make
# 
```

The resulting root filesystem can be found in output/images/rootfs.tar.gz
