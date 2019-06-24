
### Choose and Book It Backend Project

## Installation

apt-get update
apt-get install python-dev
apt-get install libssl-dev build-essential python-dev libmysqlclient-dev
apt-get build-dep python-mysqldb
apt-get install python-pip
apt-get install mysql-server
apt-get install phpmyadmin
apt-get install apache2

### Django

pip install Django==1.9.7
pip install djangorestframework
pip install markdown       # Markdown support for the browsable API.
pip install django-filter  # Filtering support
pip install django-cors-headers
pip install simplejson
pip install xlrd
pip install image
pip install python-resize-image
git clone https://github.com/2checkout/2checkout-python.git
cd 2checkout-python
sudo python setup.py install

###  Database to export

Tables 

Interests
City
Reservation Status

### Crear Usuario Admin

python manage.py  createsuperuser 
asignarle perfil admin



### Accesos

> sudo dpkg --remove postfix
> sudo dpkg --purge postfix


### Configuracios Host Server

settings.py

HOST ='http://192.168.1.33:8000'

HOST_FRONT = 'http://192.168.1.33:8080'

change hotel.py
=======
### Sandbox

Change Rutas HOST API


### Status

Status de Hotel

	1 - Draft
	2 - Requested
	3 - Published
	4 - Suspend

Status de User:

	0 - No activo (tiene que confirmar email)
	2 - User deleted
	3 - Suscrito
	4 - No Suscrito

Status de la Reserva

	1 Requested
	2 Cancelated
	3 Held
	4 Paid


### Comandos Git

rm -rf .git
git init
git add .
git commit -m 'Re-initialize repository without old history.'