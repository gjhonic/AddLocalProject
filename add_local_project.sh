#! /bin/bash

#Add Local Project and settings file host
local_path="/home/gjhonic/Files/Projects/Local"
filehost_os="/etc/hosts"
filehost_webserver="/opt/lampp/etc/extra/httpd-vhosts.conf"
project_name=$1

#Add host
echo "-> Add host"
sudo sh -c "echo '127.0.0.1       $project_name.local' >> $filehost_os"

#Settings Apache hosts
echo "-> Settings VirtualHost"
sudo sh -c "echo '<VirtualHost $project_name.local:80>' >> $filehost_webserver"
sudo sh -c "echo '    ServerName $project_name.local' >> $filehost_webserver"
sudo sh -c "echo '    DocumentRoot $local_path/$project_name' >> $filehost_webserver"
sudo sh -c "echo '    <Directory $local_path/$project_name>' >> $filehost_webserver"
sudo sh -c "echo '        Options Indexes FollowSymLinks Includes ExecCGI' >> $filehost_webserver"
sudo sh -c "echo '        AllowOverride All' >> $filehost_webserver"
sudo sh -c "echo '        Require all granted' >> $filehost_webserver"
sudo sh -c "echo '    </Directory>' >> $filehost_webserver"
sudo sh -c "echo '    ErrorLog logs/$project_name.local' >> $filehost_webserver"
sudo sh -c "echo '</VirtualHost>' >> $filehost_webserver"
sudo sh -c "echo '' >> $filehost_webserver"

#Create Foledrs Project_Name
echo "-> Create Foledrs $project_name"
cd $local_path
mkdir $project_name
cd $project_name

#Create Index.php
echo "-> Create File index.php"
echo "<h1>Hello World</h1>" >> index.php
echo "<h2>This $project_name Project</h2>" >> index.php
