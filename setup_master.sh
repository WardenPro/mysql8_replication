#!/bin/bash

REPL_USER="repl_user"
REPL_PASSWORD="repl_password"
ROOT_PASSWORD="rootpassword"

echo "Configuration du maître..."
mysql -u root -p$ROOT_PASSWORD -e "
CREATE USER IF NOT EXISTS '$REPL_USER'@'%' IDENTIFIED WITH 'mysql_native_password' BY '$REPL_PASSWORD';
GRANT REPLICATION SLAVE ON *.* TO '$REPL_USER'@'%';
FLUSH PRIVILEGES;
SHOW MASTER STATUS;
"

echo "Maître configuré."
