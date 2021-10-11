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
