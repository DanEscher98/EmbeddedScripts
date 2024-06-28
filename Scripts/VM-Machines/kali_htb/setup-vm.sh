# Install zellij multiplexer
ZELLIJ_VERSION="v0.39.2"
ZELLIJ_ASSET="zellij-x86_64-unknown-linux-musl.tar.gz"
curl --silent --show-error --location \
  https://github.com/zellij-org/zellij/releases/download/$ZELLIJ_VERSION/$ZELLIJ_ASSET -o /tmp/zellij.tar.gz
tar -xzf /tmp/zellij.tar.gz -C /tmp
sudo mv /tmp/zellij /usr/bin/
sudo chmod +x /usr/bin/zellij

echo "\n# enable zellij autostart" >> /home/vagrant/.zshrc
echo 'eval "$(zellij setup --generate-auto-start zsh)"' >> /home/vagrant/.zshrc
echo "SUCCESS: 'zellij' installed and autostart enabled"

# Init openvpn connection
if [ -n "$(find /vagrant -type f -name '*.ovpn')" ]; then
  echo "File(s) with .ovpn extension found!"
fi
