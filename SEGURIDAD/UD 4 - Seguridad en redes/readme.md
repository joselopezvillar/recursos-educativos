# Seguridad en redes

## Wireshark
* Wireshark: introducción e instalación
* Wireshark: perfiles (profiles)
* Wireshark: estadísticas
* Wireshark: filtros de visualización
* Wireshark: reglas de colores
* Wireshark: geolocalización
* Usando los conocimientos adquiridos en los vídeos, hacer el boletín filtros visualización, coloring rules y estadísticas.
* Wireshark: streams
* Wireshark: I/O gráficos
* Wireshark: captura de paquetes
* Wireshark: filtros de captura
* Wireshark: filtros de captura avanzados
* Usando los conocimientos adquiridos en los vídeos, hacer el boletín filtros de captura
* Terminar Boletín filtros visualización, coloring rules y estadísticas y Boletín filtros de captura.
* Aplicar los conocimientos adquiridos en las semanas anteriores para hacer el análisis de un incidente por malware en Windows: Análisis forense en red#1

## Análisis forense y respuesta a incidentes en red 
* Lectura Análisis forense y respuesta a incidentes en red
* La parte de evidencias basadas en red tiene un vídeo explicativo: Network Based Evidence
* Lectura ¿Dónde capturo paquetes?
* Vídeo explicativo ¿Dónde capturo paquetes?
* Instalación de Brim 
* Vídeo Introducción a Zeek y Brim (session y alert data) --> se explica el trabajo con los session y alert data usando Brim y resolviendo el reto de análisis forense en red #1
* Analizar alguna captura de red para poner en práctica todos los conocimientos de este tema.
* Lectura de Registros (logs). Haz los ejemplos del tema usando los archivos nmap.txt y passwd


El archivo sanclemente-forense-01.pcap.zip contiene una captura de red correspondiente a un incidente por malware para Windows. Es recomendable realizar el análisis del pcap en un sistema Linux para evitar que cuando se extraiga el malware de la captura lo borre el sistema antivirus de Windows o se infecte el equipo en caso de que ejecutar el software malicioso.

La contraseña para extraer el pcap es: infected

## Logs
* Boletín registros (logs) 
* Analizar logs para poner en práctica todos los conocimientos de este tema.
* [Reto Hammered (Cyberdefenders)URL](https://cyberdefenders.org/blueteam-ctf-challenges/42). Ver Ficheros Hammered

Reflexión. Algunos de los resultados que se obtienen (como listados de direcciones IP, nombres de dominio, ...) pueden usarse para alimentar a otros comandos o programas lo que permite automatizar ciertas tareas.

Por ejemplo, un listado de direcciones IP extraídas de access.log podría usarse para localizar el país donde está la IP usando la herramienta mmdbresolve o consultar con un listado de IPs o dominios maliciosos.