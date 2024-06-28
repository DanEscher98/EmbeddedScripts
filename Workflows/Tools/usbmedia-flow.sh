DEVICE="/dev/sdb"
NAME="ADATA"
FILE="fedora.iso"

# FORMAT AN USB BACK TO NORMAL
sudo umount /dev/$DEVICE*
sudo wipefs --all /dev/$DEVICE
sudo cfdisk /dev/$DEVICE
# dos > new > enter > primary > write > yes > quit
sudo mkfs.vfat -n $NAME "$DEVICE"1
# alternate method
sudo dd if=/dev/zero of=/dev/$DEVICE

# WRITE ISO TO USB
sudo mkfs.exfat -n $NAME "$DEVICE"1
sudo dd if=$FILE of=$DEVICE bs=1M status=progress




# CHECKING SHA256
sudo head -c $(stat -c '%s' $FILE) $DEVICE | sha256sum
sudo dd if=$DEVICE bs=4096 count=$(($(stat -c '%s' $FILE) / 4096)) | sha256sum

# Mount Hard-Drive
DEVICE="/dev/sdb"
lsusb
lsblk

# Output low-level information for the provided block device and partition.
udisksctl info -b "$DEVICE"1

# Mount partition on the given block device. Default: '/media'
udisksctl mount -b "$DEVICE"1
udisksctl unmount -b "$DEVICE"2
udisksctl power-off -b $DEVICE


