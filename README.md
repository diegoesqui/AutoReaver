# AutoReaver
Serie de scripts para automatizar las tareas de recuperacion de claves con Reaver.

Reaver es una aplicación que se encarga de explotar las redes wifi utilizando ataques de fuerza bruta contra el WPS (Wi-fi Protected Setup). El WPS es un código numérico utilizado en muchos routers para autenticar a dispositivos moviles.
Reaver por defecto solo funciona en Linux pero se puede parchear para que funcione tambien en Mac OS X.

# Instalacion de Reaver en Mac OS X
1) Abrimos la terminal y creamos un enlace simbolico a airport para poder llamarlo desde el terminal:

	$ sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport 

2) Descargamos y parcheamos reaver para que funcione en Mac OS X:

	$ curl "https://reaver-wps.googlecode.com/files/reaver-1.4.tar.gz" 
	$ curl http://www.redaven.com/download/reaver_osx.diff > reaver_osx.diff 
	$ tar xvfz reaver-1.4.tar.gz 
	$ cd reaver*/src 
	$ patch -p0 -i ../../reaver_osx.diff 
	$ ./configure $ make $ sudo make install  

Red en1 en modo monitor

# Instalacion de Reaver en Linux (Debian)

	$ sudo apt-get update
	$ sudo apt-get aircrack-ng reaver macchanger
	
# En caso de tener instalado la última versión de Ubuntu (14.04)
Las dependencias libpcap y libpcap-dev tienen algun tipo de incompatibilidad en su nueva versión, por lo que el comando wash deja de funcionar. Es necesario hacer un downgrade a la version de Ubuntu 13.10 de estos dos paquetes para corregirlo.

	$ wget http://mirrors.kernel.org/ubuntu/pool/main/libp/libpcap/libpcap0.8_1.4.0-2_amd64.deb
	$ wget http://mirrors.kernel.org/ubuntu/pool/main/libp/libpcap/libpcap0.8-dev_1.4.0-2_amd64.deb
	$ sudo dpkg -i libpcap0.8_1.4.0-2_amd64.deb libpcap0.8-dev_1.4.0-2_amd64.deb
