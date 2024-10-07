#!/bin/bash

MASTER_HOST="mysql_master"
REPL_USER="repl_user"
REPL_PASSWORD="repl_password"
ROOT_PASSWORD="rootpassword"

echo "Configuration de l'esclave..."
mysql -u root -p$ROOT_PASSWORD -e "
STOP SLAVE;
SET GLOBAL enforce_gtid_consistency = ON;
SET GLOBAL gtid_mode = OFF_PERMISSIVE;
SET GLOBAL gtid_mode = ON_PERMISSIVE;
SET GLOBAL gtid_mode = ON;
CHANGE MASTER TO
MASTER_HOST='$MASTER_HOST',
MASTER_USER='$REPL_USER',
MASTER_PASSWORD='$REPL_PASSWORD',
MASTER_AUTO_POSITION = 1;
START SLAVE;
SHOW SLAVE STATUS\G;
"

echo "Esclave configuré."
