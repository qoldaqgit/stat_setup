#Project name $1
#! /bin/bash

#set Variables
project=$(echo $1 | tr '[:upper:]' '[:lower:]')
ip=$(ip a | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

#Get ci4 source
sudo composer create-project codeigniter4/appstarter $project 
sudo mv $project /var/www/$project > /dev/null
sudo chown -R $USER /var/www/$project
sudo chown -R www-data /var/www/$project/writable/

sudo touch /etc/apache2/sites-available/$project.conf

echo '
<VirtualHost *:80>

        DocumentRoot /var/www/'$project'/public
        <Directory /var/www/'$project'/public>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' | sudo tee -a /etc/apache2/sites-available/$project.conf > /dev/null

sudo a2ensite $project.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite

sudo systemctl restart apache2


#Setup Dev Env
touch /var/www/$project/.env
echo "CI_ENVIRONMENT = development 
app.baseURL = 'http://$ip'
app.indexPage = ''"| tee -a /var/www/$project/.env

#Activate autoRoute =true
> /var/www/$project/app/Config/Routing.php
echo "<?php
namespace Config;
use CodeIgniter\Config\Routing as BaseRouting;
class Routing extends BaseRouting
{
    public array \$routeFiles = [
        APPPATH . 'Config/Routes.php',
    ];
    public string \$defaultNamespace = 'App\Controllers';
    public string \$defaultController = 'Home';
    public string \$defaultMethod = 'index';
    public bool \$translateURIDashes = false;
    public ?string \$override404 = null;
    public bool \$autoRoute = true;
    public bool \$prioritize = false;
    public array \$moduleRoutes = [];
}
"| tee -a  /var/www/$project/app/Config/Routing.php > /dev/null

#Activate autoRoutesImproved = true
> /var/www/$project/app/Config/Feature.php
echo "<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class Feature extends BaseConfig
{
    public bool \$multipleFilters = false;
    public bool \$autoRoutesImproved = true;
}

"| tee -a  /var/www/$project/app/Config/Feature.php  > /dev/null

cd /var/www/$project
clear

echo "
CodeIgniter $version is now installed, find your project root @ /var/www/$project

To install Shield
composer require codeigniter4/shield
php spark shield:setup

on the browser go to http://$ip
"
