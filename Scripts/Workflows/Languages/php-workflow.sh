# APT PROCESS install prerequisites
sudo apt install ca-certificates apt-transport-https software-properties-common
# install Ondrej PHP repository
sudo add-apt-repository ppa:ondrej/php
# verify that the repository were added
sudo grep -rhE ^deb /etc/apt/sources.list* | grep -i ondrej
# install php 8.1
sudo apt install php8.1 -y
# suggested modules
sudo apt install php8.1-{gd,zip,mysql,oauth,yaml,fpm,mbstring,memcache,common,xml}

# DNF PROCESS
# php repository
sudo dnf install http://rpms.remirepo.net/fedora/remi-release-36.rpm -y
# verify that the repository was added
dnf repolist | grep remi
# import the GPG key
yes | sudo dnf module list php
# enable the repository
sudo dnf config-manager --set-enabled remi
sudo  dnf module reset php
# install for apache
sudo dnf module install php:remi-8.1 -y
# suggested modules
sudo dnf install php-{cli,fpm,curl,mysqlnd,gd,opcache,zip,intl,common,bcmath,imagick,xmlrpc,json,readline,memcached,redis,mbstring,apcu,xml,dom,redis,memcached,memcache}
# additional tools
sudo dnf install php-xdebug php-pcov
# REFERENCES
# - https://www.linuxcapable.com/how-to-install-php-8-1-on-fedora-36-linux-2/

# retrieve the Composer installer
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
# fetch the latest signature and store it in a shell variable
HASH=$(curl -sS https://composer.github.io/installer.sig)
# verify that the installation script is safe to run
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# download and install Composer as a system-wide command named composer
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
# New project throught Composer
composer create-project laravel/laravel $PROJECT
# Laravel install
composer global require laravel/installer
<<<<<<< HEAD

# INIT TESTS PROJECT
composer init
composer require phpunit/phpunit
composer require brianium/paratest

laravel new "<project-name>" --git --branch="main"
php artisan make:test "<test-name>" --unit
php artisan test --parallel --testsuite=Unit #--stop-on-failure
# For PEST tests
composer require pestphp/pest-plugin-laravel --dev
php artisan pest:install
php artisan make:test "<test-name>" --unit --pest

=======
echo "set -gx PATH $PATH $HOME/.config/composer/vendor/bin" >> config.fish
laravel new $PROJECT
>>>>>>> 44a812e865ed5cd1af20e505dfbe3dec14f946d0
