# Add official repo and install
sudo dnf install https://repo.mysql.com//mysql80-community-release-fc31-1.noarch.rpm
sudo dnf install mysql-community-server
# Enable the service
sudo systemctl enable mysqld
sudo systemctl start mysqld
# Configure MySQL for first use
sudo mysql_secure_installation
# Use MySQL
sudo mysql -u root -p
# REFERENCES
# https://docs.fedoraproject.org/en-US/quick-docs/installing-mysql-mariadb/
