

Servicio DHCP: Parámetros de configuraciónURL
Enlace a unos apuntes donde se explica el protocolo DHCP y se detalla el significado de los parámetros de configuración del servicio:
https://www.fpgenred.es/DHCP/index.html

Atención especial requieren las secciones de /etc/dhcp/dhcpd.conf en adelante:
https://www.fpgenred.es/DHCP/etcdhcpdhcpdconf.html

Videos

Introducción a los Servicios de Red e Internet con Packet Tracer
Vídeo introductorio a los SRI en Packet Tracer. Se crean dos subredes con distintos servicios: DHCP, DNS, WEB, FTP, MAIL. Se configuran equipos con DHCP. Se configura un router como Agent Relay para enviar peticiones de una red a otra. 
https://www.youtube.com/watch?v=_2sHKoGtxss


Instalación del servicio ISC-DHCP en Ubuntu 20.04
Instalación del servidor isc-dhcp-server en Ubuntu 20.04 y configuración del mismo para que a un cliente le asigne una IP en un rango y a otro una IP concreta.
https://www.youtube.com/watch?v=PnRxWmJXpv4


Análisis de tráfico DHCP con Wireshark
Uso de la herramienta Wireshark para analizar el tráfico de red. Análisis de un proceso de concesión y de uno de renovación.
https://www.youtube.com/watch?v=wpeTTZSuFys


DHCP: Seguridad y ataques
Vídeo explicativo sobre la seguridad en DHCP: ataques y qué hacer ante ellos. Demostración de un ataque DHCP Starvation utilizando yersinia (DDOS) y de un ataque DHCP Rogue utilizando Ettercap (MiTM).
https://www.youtube.com/watch?v=AKk-LEh9ep8


DHCP Failover Protocol
El servicio DHCP puede ser crítico en redes medianas y grandes. El DHCP Failover Protocol permite que tengamos dos servidores (primario y secundario) operando de forma conjunta en una red (alta disponibilidad) e implementa un algoritmo de balanceo de carga. En este vídeo veremos cómo instalar un servidor primario y uno secundario.
https://www.youtube.com/watch?v=epBCAkVDM74


DHCP: Configuración gráfica
En linux los ficheros de configuración suelen ser archivos de texto que tenemos que editar, y en ellos podemos cometer fallos tipográficos o de sintaxis. Existen herramientas gráficas que nos permiten configurar el servicio DHCP a través de una interfaz web. En este vídeo veremos las interfaces web de configuración de dos routers y la instalación de Webmin para gestionar en un servidor los servicios a través del navegador.
https://www.youtube.com/watch?v=Sb_Sd6fOZKQ