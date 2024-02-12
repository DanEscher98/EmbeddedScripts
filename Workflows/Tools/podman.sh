sudo dnf -y install podman
sudo systemctl status podman
sudo dnf install podman-compose

podman pull hello-world 
podman run hello-world
