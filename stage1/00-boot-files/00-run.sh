#!/bin/bash -e

install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"

if [ "${GLOWORM}" == "1" ]; then
    dtc -O dtb files/gloworm-dt-blob.dts -o "${ROOTFS_DIR}/boot/dt-blob.bin"

    # Modify config.txt to include enc28j60 overlay
    cat << EOF >> ${ROOTFS_DIR}/boot/config.txt

    dtoverlay=enc28j60
EOF
fi