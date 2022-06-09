# FORMAT AN USB BACK TO NORMAL
DEVICE=sdb
NAME="ADATA"
sudo umount /dev/$DEVICE*
sudo wipefs --all /dev/$DEVICE
sudo cfdisk /dev/$DEVICE
# dos > new > enter > primary > write > yes > quit
sudo mkfs.vfat -n $NAME /dev/"$DEVICE"1
# alternate method
sudo dd if=/dev/zero of=/dev/$DEVICE
