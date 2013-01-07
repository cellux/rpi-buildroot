# Buildroot add-on for building a Raspberry Pi root filesystem

(warning: this is work in progress)

```bash
# create folder for ccache and dl directories
mkdir $HOME/.buildroot

# clone repo
git clone https://github.com/cellux/rpi-buildroot.git

# download and extract buildroot
wget http://buildroot.uclibc.org/downloads/buildroot-2012.11.1.tar.gz
tar xvzf buildroot-2012.11.1.tar.gz
cd buildroot-2012.11.1

# create symlinks for add-on packages
for p in board/rpi package/rpi; do
  ln -s $(readlink -f ../rpi-buildroot/$p) $p
done

# override packages which have been customized
cat <<EOT >local.mk
LUAJIT_OVERRIDE_SRCDIR = $(readlink -f ../rpi-buildroot/package/luajit)
EOT

# add the following line above the last 'endmenu' in package/Config.in:
source "package/rpi/Config.in"

# install customized buildroot config
cp ../rpi-buildroot/.config .

# configure (optional)
make menuconfig

# create root filesystem
make clean all
```

The resulting root fs may be found in `output/images/rootfs.tar.gz`
