#sudo curl -sSL https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/install.sh
sudo apt update
sudo apt install php phpunit composer -y

#download CI4 easy_scripts
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/create_project.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/create_controller.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/stat_setup/refs/heads/main/ci4/uninstall_ci4.sh
