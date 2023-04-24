#!/bin/bash

rm -f $1

cat <<EOF >> $1
# This file is auto-generated
# Do not edit this file directly

dir /bin 755 0 0
dir /etc 755 0 0
dir /dev 755 0 0
dir /lib 755 0 0
dir /lib64 755 0 0
dir /lib64/lp64d 755 0 0
dir /proc 755 0 0
dir /sbin 755 0 0
dir /sys 755 0 0
dir /tmp 755 0 0
dir /usr 755 0 0
dir /mnt 755 0 0
dir /usr/bin 755 0 0
dir /usr/lib 755 0 0
dir /usr/sbin 755 0 0
dir /var 755 0 0
dir /var/tmp 755 0 0
dir /root 755 0 0
dir /var/log 755 0 0

nod /dev/console 644 0 0 c 5 1
nod /dev/null 644 0 0 c 1 3
EOF

LIBS=()
LIBS+=(ld-linux-riscv64-lp64d.so.1)

for lib in ${LIBS[@]}; do
    p="$RISCV/sysroot/lib/$lib"
    if [ ! -f $p ]; then
        echo "Could not find library $p"
        exit 1
    fi
    echo "file /lib/$lib $p 755 0 0" >> $1
done

LIBS=()
LIBS+=(libc.so.6)
LIBS+=(libdl.so.2)
LIBS+=(libm.so.6)
LIBS+=(libpthread.so.0)
LIBS+=(libresolv.so.2)

for lib in ${LIBS[@]}; do
    p="$RISCV/sysroot/lib64/lp64d/$lib"
    if [ ! -f $p ]; then
        echo "Could not find library $p"
        exit 1
    fi
    echo "file /lib64/lp64d/$lib $p 755 0 0" >> $1
done

cat <<EOF >> $1
file /bin/busybox ${INITRAMFS_ROOT}/apps/busybox/busybox 755 0 0
file /etc/inittab ${INITRAMFS_ROOT}/files/etc/inittab 755 0 0
slink /init /bin/busybox 755 0 0
EOF
