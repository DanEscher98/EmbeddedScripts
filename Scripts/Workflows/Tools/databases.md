# Template of Workflow Guide

## Official Docs
- []()

## Install toolchain
```sh

```


## Create project
```sh

```


## Develop, Test, Build, Deploy Cycle
```sh

```

## Specific Workflows

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
---
title: PostgreSQL workflow
author: Daniel Sanchez
---

## First time

> $ sudo dnf install postgresql postgresql-server
> $ sudo postgresql-setup --initdb --unit postgresql
> $ postgresql-setup upgrade
> $ sudo systemctl enable postgresql
> $ sudo systemctl start postgresql
> $ sudo firewall-cmd --zone=public --permanent --add-port 5432/tcp
> $ sudo firewall-cmd --reload

### Programming libraries

> dnf install libpq-devel
> stack install postgresql-simple
> pip install psycopg2

## Create user with password

> ]$ psql
> ]$ createuser \<user> 
> \# ALTER USER postgres PASSWORD 'mypswd';
> ]$ createdb \<database> --owner \<user>

## Create database

> $ sudo su - postgres
> ]$ createdb quick-start
> ]$ psql -d quick-start
>
$ sudo su - postgres
$ createuser testuser -P
Enter password for new role:
Enter it again:
$ createdb testdb --owner testuser
$ # add 'local all testuser md5' line **before** 'local all all peer' line
$ # (typical mistake is "just" appending the line at the and of the file)
$ vim ~/data/pg_hba.conf
$ cat ~/data/pg_hba.conf | grep ^local
local   all             testuser                                md5
local   all             all                                     peer
$ ^D
$ sudo systemctl restart postgresql
$ psql -d testdb -U testuser
Password for user testuser:
psql (9.3.9)
Type "help" for help.
