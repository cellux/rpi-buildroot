# Buildroot add-on for building a Raspberry Pi root filesystem

(warning: this is work in progress)

```bash
git clone http://github.com/cellux/rpi-buildroot.git
wget http://buildroot.uclibc.org/downloads/buildroot-2012.11.1.tar.gz
tar xvzf buildroot-2012.11.1.tar.gz
cd buildroot-2012.11.1
for p in board/rpi package/rpi package/luajit/luajit-hardfp.patch; do
  ln -s $(readlink -f ../rpi-buildroot/$p) $p
done
cp ../rpi-buildroot/.config .
make
# 
```

The resulting root filesystem can be found in output/images/rootfs.tar.gz
