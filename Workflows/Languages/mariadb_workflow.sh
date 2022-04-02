
# sudo dnf install mariadb mariadb-server
sudo apt install mariadb-client mariadb-server

grep mysql /etc/group

sudo mysql_install_db --user=mysql

sudo mysqladmin -u root password 'new-password'

sudo systemctl start mariadb
sudo systemctl enable --now mariadb
sudo systemctl status mariadb

## Enter to root
mysqladmin binary
