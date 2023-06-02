# Add repostiory
sudo dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/F-37-x86_64/pgdg-fedora-repo-latest.noarch.rpm
# Or Add module and Install packages
sudo dnf module reset postgresql -y
sudo dnf module enable postgresql:14
sudo dnf install postgresql14-server postgresql14
# Initialize
sudo postgresql-setup --initdb
sudo systemctl enable --now postgresql
systemctl status postgresql
# Enable remote access
sudo firewall-cmd --add-service=postgresql --permanent
sudo firewall-cmd --reload

echo '# Accept from anywhere
host all all 0.0.0.0/0 md5

# Accept from trusted subnet
host all all 10.10.10.0/24 md5' | sudo tee /var/lib/pgsql/data/pg_hba.conf

sudo systemctl restart postgresql

# Setup password
sudo su - postgres
psql -c "alter user postgres with password '<password>'"

# Install pgAdmin4
PGADMIN_VERSION="pgadmin4-fedora-repo-2-1"
wget  https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/$PGADMIN_VERSION.noarch.rpm
sudo rpm -Uvh $PGADMIN_VERSION.noarch.rpm
sudo dnf install pgadmin4

# Enable pgAdmin4
sudo systemctl start httpd && sudo systemctl enable httpd
sudo /usr/pgadmin4/bin/setup-web.sh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
firefox http://[serverip_or_hostname]/pgadmin4

# Uninstall
systemctl stop postgresql
sudo dnf remove postgresql-server postgresql
sudo rm -rf /var/lib/pgsql/data
sudo userdel postgres
