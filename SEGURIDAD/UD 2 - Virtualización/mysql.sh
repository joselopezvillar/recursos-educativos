#!/bin/bash

echo "-----------------"
echo "Actualizando repositorios y equipo"
apt update
apt full-upgrade -y

echo "-----------------"
echo "Instalando mysql"

echo "mysql-server mysql-server/root_password password wordpress" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password wordpress" | debconf-set-selections
apt install net-tools mysql-server mysql-client -y 

echo "------------------"
echo "Configurando socket y reiniciando mysql"

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
systemctl restart mysql.service

echo "------------------"
echo "Creando base datos"
mysql -uroot -pwordpress -h localhost -e "CREATE DATABASE wordpress;"
mysql -uroot -pwordpress -h localhost -e "CREATE USER wordpress@192.168.56.21 IDENTIFIED BY 'Abc123..'";
mysql -uroot -pwordpress -h localhost -e "GRANT ALL ON wordpress.* TO wordpress@192.168.56.21";


echo "------ FIN ------"
