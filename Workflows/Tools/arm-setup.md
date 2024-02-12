sudo dnf install qemu-user-static
sudo systemctl enable --now systemd-binfmt
sudo docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
sudo docker run -it --rm arm32v7/debian:buster-slim

