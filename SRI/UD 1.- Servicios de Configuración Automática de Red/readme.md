

# Servicio DHCP: Parámetros de configuraciónURL

[Enlace a unos apuntes](https://www.fpgenred.es/DHCP/index.html) donde se explica el protocolo DHCP y se detalla el significado de los parámetros de configuración del servicio:


Atención especial requieren las secciones de /etc/dhcp/dhcpd.conf en adelante:
https://www.fpgenred.es/DHCP/etcdhcpdhcpdconf.html

# Videos 

## Introducción a los Servicios de Red e Internet con Cisco Packet Tracer 
[Vídeo introductorio](https://www.youtube.com/watch?v=_2sHKoGtxss) a los SRI en Cisco Packet Tracer. Se crean dos subredes con distintos servicios: DHCP, DNS, WEB, FTP, MAIL. Se configuran equipos con DHCP. Se configura un router como Agent Relay para enviar peticiones de una red a otra. 



## Instalación del servicio ISC-DHCP en Ubuntu 20.04 
[https://www.youtube.com/watch?v=PnRxWmJXpv4](Instalación del servidor isc-dhcp-server en Ubuntu 20.04) y configuración del mismo para que a un cliente le asigne una IP en un rango y a otro una IP concreta.



## Análisis de tráfico DHCP con Wireshark 
[https://www.youtube.com/watch?v=wpeTTZSuFys](Uso de la herramienta Wireshark para analizar el tráfico de red). Análisis de un proceso de concesión y de uno de renovación.

## DHCP: Seguridad y ataques 
[https://www.youtube.com/watch?v=AKk-LEh9ep8](Vídeo explicativo) sobre la seguridad en DHCP: ataques y qué hacer ante ellos. Demostración de un ataque DHCP Starvation utilizando yersinia (DDOS) y de un ataque DHCP Rogue utilizando Ettercap (MiTM).



## DHCP: Failover Protocol
El servicio DHCP puede ser crítico en redes medianas y grandes. El [https://www.youtube.com/watch?v=epBCAkVDM74](DHCP Failover Protocol) permite que tengamos dos servidores (primario y secundario) operando de forma conjunta en una red (alta disponibilidad) e implementa un algoritmo de balanceo de carga. En este vídeo veremos cómo instalar un servidor primario y uno secundario.



## DHCP: Configuración gráfica
En linux los ficheros de configuración suelen ser archivos de texto que tenemos que editar, y en ellos podemos cometer fallos tipográficos o de sintaxis. Existen [https://www.youtube.com/watch?v=Sb_Sd6fOZKQ](herramientas gráficas) que nos permiten configurar el servicio DHCP a través de una interfaz web. En este vídeo veremos las interfaces web de configuración de dos routers y la instalación de Webmin para gestionar en un servidor los servicios a través del navegador.

