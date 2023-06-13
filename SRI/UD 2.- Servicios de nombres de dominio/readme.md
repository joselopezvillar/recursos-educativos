# Contidos

[Apuntes de DNS](https://www.fpgenred.es/DNS/include.html). Unos muy buenos apuntes del servicio DNS que están especialmente bien organizados, con archivos de ejemplo. (En castellano).

[DNS for Rocket Scientists](https://www.zytrax.com/books/dns/). En esta página hay un montón de documentación del servicio, junto a múltiples archivos de configuración de ejemplo. Y como ya imaginas por el título, sí, está en inglés. 

[Seguridad en DNS](https://www.cloudflare.com/es-es/learning/dns/dns-security/ ). Como parte de seguridad en DNS, solo entra el contenido de esta página. Hay que tener noticiones de qué vectores de ataques existen en DNS y qué es DNSSEC (por encima), pero no vamos a profundizar en ellos como en el tema de DHCP.

# Vídeos

## El fichero HOSTS
[Vídeo](https://www.youtube.com/watch?v=mqFh9_-Qnz0) sobre la necesidad de traducir nombres a direcciones IP y uso del fichero HOSTS para realizar traducciones locales.

## Instalación y configuración de un servidor DNS
[Vídeo](Instalación y configuración del servidor DNS Bind9 en Ubuntu 22.04) sobre la instalación y configuración de un servidor Bind9 en Ubuntu 22.04LTS. Creación de una zona y transferencia de zona de un servidor primario a un servidor secundario. Resolución inversa. Hai un error en el vídeo. El servidor secundario debe de especificar un archivo fuera de /etc/bind/, normalmente en /var/lib/bind/<archivo-zona> ya que Bind no puede escribir en /etc/bind. Leer la descripción del vídeo en Youtube para más info. 

## Conceptos DNS
[Vídeo](https://www.youtube.com/watch?v=GMKagX4SksQ) clarificador de los conceptos DNS. Está basado en muchas de las dudas que me habéis planteado relacionadas con: resolución inversa, delegación de zona, etc. También enseño cómo registrar un dominio y administrar su dns, cómo configurar un router para DDNS, y el panel del Pihole, para bloquear publicidad. Es un vídeo que mezcla varias cosas y que habla un poquito de todo.

## Herramientas DNS
[Vídeo](https://www.youtube.com/watch?v=6SKjKQBWzK8) sobre las herramientas DNS más populares para realizar consultas: Ping, nslookup, dig, host. También hablo de páginas que crean reportes de configuración de DNS y nos pueden ayudar a configurar mejor el servicio. Y del comando Whois y de páginas para realizar Whois, para obtener información de los registros de dominios.

## Delegación de zona con Bind9 y contenedores DockerURL
En este [tutorial o práctica](https://www.youtube.com/watch?v=q_MCqyukJ34) se crean dos contenedores Docker. Uno con la zona "patata.com" y otro con la zona "tortilla.patata.com" delegada por el primero. Se utiliza un contenedor adicional para las consultas.
