sudo apt update && sudo apt upgrade -y
#Install MariaDB
sudo apt install mariadb-server -y
sudo mysql_secure_installation

#Switch to unix_socket authentication [Y/n] n
#Change the root password? [Y/n] n 
#Remove anonymous users? [Y/n] y
#Disallow root login remotely? [Y/n] y
#Remove test database and access to it? [Y/n] y
#Reload privilege tables now? [Y/n] y


#create a new user by:
sudo mysql
  CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
  GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost' WITH GRANT OPTION;
  FLUSH PRIVILEGES;


#CREATE USER 'dbmaster'@'%' IDENTIFIED VIA mysql_native_password USING '1234';
#GRANT ALL PRIVILEGES ON *.* TO 'dbmaster'@'%';

#Install PhpMyadmin
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
