#!/bin/bash

# Initializes the DB data directory and creates the system tables
# in the mysql database, if they do not exist.
mysql_install_db --datadir=/var/lib/mysql

# Starts mysqld with some extra safety features
mysqld_safe -u root & sleep 5

#MARIADB
mysql -u root -e  "CREATE DATABASE tevelyne_db; \
                  GRANT ALL PRIVILEGES ON tevelyne_db.* TO 'tevelyne'@'%' \
				  IDENTIFIED BY 'pass'; \
                  FLUSH PRIVILEGES;"

# Imports database backup
 mysql tevelyne_db -u root < tevelyne_db.sql

# Avoids container to stop
sleep infinity & wait