# install prerequisites
sudo apt install ca-certificates apt-transport-https software-properties-common
# install Ondrej PHP repository
sudo add-apt-repository ppa:ondrej/php
# verify that the repository were added
sudo grep -rhE ^deb /etc/apt/sources.list* | grep -i ondrej
# install php 8.1
sudo apt install php8.1 -y
# suggested modules
sudo apt install php8.1-{gd,zip,mysql,oauth,yaml,fpm,mbstring,memcache,common,xml}
# retrieve the Composer installer
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
# fetch the latest signature and store it in a shell variable
HASH=$(curl -sS https://composer.github.io/installer.sig)
# verify that the installation script is safe to run
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# download and install Composer as a system-wide command named composer
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
