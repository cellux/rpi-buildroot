# Buildroot add-on for building a Raspberry Pi root filesystem

(warning: this is work in progress)

```bash
# create folder for ccache and dl directories
# (must be at this location, the buildroot config refers to it)
mkdir $HOME/.buildroot

# create a temp directory for build (may be anywhere)
mkdir -p /tmp/buildroot
cd /tmp/buildroot

# clone this repo
git clone https://github.com/cellux/rpi-buildroot.git

# download and extract buildroot
wget http://buildroot.uclibc.org/downloads/buildroot-2012.11.1.tar.gz
tar xvzf buildroot-2012.11.1.tar.gz
cd buildroot-2012.11.1

# create symlinks for board-specific scripts and add-on packages
for p in board/rpi package/rpi; do
  ln -s $(readlink -f ../rpi-buildroot/$p) $p
done

# override packages which have been customized
for p in luajit; do
  rm -rf package/$p
  ln -s $(readlink -f ../rpi-buildroot/package/$p) package/$p
done

# add the following stanza above the last 'endmenu' line in package/Config.in:
source "package/rpi/Config.in"

# install customized buildroot config
cp ../rpi-buildroot/.config .

# configure (optional)
make menuconfig

# create root filesystem
make clean all
```

The resulting files are:

* `output/images/bootfs.tar.gz`
* `output/images/rootfs.tar.gz`

The first one should be extracted to the first (FAT32) partition of the SD
card, the second one to the root partition (wherever it is).

