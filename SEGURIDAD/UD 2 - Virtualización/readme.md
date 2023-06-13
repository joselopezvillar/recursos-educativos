# Unidad didáctica 2 - Virtualización

# Hoja de ruta
* Lectura del pdf Virtualización. Hypervisores
* Prácticas guiadas sobre Virtualbox: visualizar vídeos y replicar.
* Lectura del pdf Modos de red en virtualbox
* Lectura del pdf Vagrant: qué es Vagrant, terminología, estudio y comprensión de las imágenes relativas al concepto de Infrastructure as code (IaC) y flujo de trabajo de Vagrant.
* Escenario prácticos:
** Escenario #1: instalación de Vagrant en el equipo real y primer despliegue básico.
** Escenario #2: despliegue de un sistema LAMP (Linux Apache MySQL PHP).
** Escenario #3: despliegue de un cluster de servidor web y servidor de base de datos.
** Escenario #4: despliegue de un cluster de 3 servidores web.
** Escenario #5: despliegue de una infraestructura con un FW y servidor web interno.

Los escenarios prácticos están explicados tanto en el pdf como en los vídeos, y los scripts de aprovisionamiento están disponibles en la sección de Recursos.

Se explicará la terminología de vagrant, su flujo de trabajo y las ventajas de usar herramientas de Infrastructure as code (IaC).

## Virtualbox

Fichero pdf. Virtualización. Hypervisores

### Prácticas guiadas
* Virtualbox: instalación y configuración
* Virtualbox: creacion maquina virtual e instalación de Linux Xubuntu
* Virtualbox: instalacion guest additions
* Virtualbox: Instantáneas
* Virtualbox: Clonación
* Virtualbox: Grupos
* Virtualbox: borrar maquinas virtuales
* Virtualbox: exportar e importar máquinas virtuales
* Virtualbox: carpeta compartida
* Modos de red en virtualbox

Sobre la instalación. La nueva versión de Virtual es la 6.1.38 y en el vídeo se ve la instalación de la versión 6.1.28 en un sistema Linux Ubuntu. Las instrucciones son válidas pero como se ve en la web de Virtualbox, ha cambiado la línea para añadir el repositorio oficial y ahora es:

deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtu... mydist contrib

Si el sistema real donde se instala Virtualbox es Ubuntu 20.04 hay que reemplazar mydist por focal y si es Ubuntu 22.04 hay que reemplazar mydist por jammy

La línea para combinar la descarga y registro de la clave pública también ha cambiado y ahora es:

wget -O- https://www.virtualbox.org/download/o... | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg


## Vagrant

Fichero pdf. Vagrant.

### Prácticas guiadas

* Vagrant: escenario#1 despliegue básico
* Vagrant: escenario#2 LAMP (Linux-Apache-MySQL-PHP)
* Vagrant: escenario#3 Cluster Web-Base de datos
* Vagrant: escenario#4 Cluster de servidores web
* Vagrant: escenario#5 Firewall y servidor interno
* Script de aprovisionamiento lamp.sh
* Script de aprovisionamiento apache.sh
* Script de aprovisionamiento mysql.sh