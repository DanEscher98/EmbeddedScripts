DEVICE="/dev/sdb"
NAME="ADATA"
FILE=""


# WRITE ISO TO USB
sudo dd if=$FILE of=$DEVICE bs=1M status=progress


# FORMAT AN USB BACK TO NORMAL
sudo umount /dev/$DEVICE*
sudo wipefs --all /dev/$DEVICE
sudo cfdisk /dev/$DEVICE
# dos > new > enter > primary > write > yes > quit
sudo mkfs.vfat -n $NAME "$DEVICE"1
# alternate method
sudo dd if=/dev/zero of=/dev/$DEVICE


# CHECKING SHA256
sudo head -c $(stat -c '%s' $FILE) $DEVICE | sha256sum
sudo dd if=$DEVICE bs=4096 count=$(($(stat -c '%s' $FILE) / 4096)) | sha256sum
