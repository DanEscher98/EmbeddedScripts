sudo pkg install -y fish
echo "/usr/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
sudo pkg install -y smartmontools
echo 'smartd_enable="YES"' | sudo tee -a /etc/rc.conf
