#sudo curl -sSL https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/install.sh
sudo apt update
sudo apt install apache2  php zip unzip php-zip php-curl libapache2-mod-php php8.1-mbstring php-intl php-mysql gh nano ssmtp git -y 
sudo apt install php-cli php-json php-mbstring php-xml php-pcov php-xdebug -y
sudo apt install composer -y

#download CI4 easy_scripts
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/create_project.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/create_controller.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/unistall.sh
