# Tareas

## 1ª av

## 2ª av

## 3ª av

### Seguridad por obscuridad (máx 0,35 ptos en la Ev.)

Tomando como punto de partida el estado del escenario Seguridad por oscuridad: Port-Knocking y SPA al terminar la práctica guiada.

#### Parte I: nmap
Entrega un vídeo  donde se vea como se hace un barrido de puertos con nmap dirigido a la IP pública de FW desde un equipo situado en 'Internet' ejecutando el siguiente comando:

sudo nmap -A -p 1-100,10000-22100 192.0.2.254 -T4 -v

#### Parte II: servidor SPA
Entrega un vídeo donde se vea una terminal dividida en dos secciones horizontales:
* En la sección superior se está ejecutando en FW el comando tail -f /var/log/syslog | grep -i fwk
* En la sección inferior se ve:
** como un cliente SPA solicita la apertura del puerrto para poder conectarse por ssh al servidor de la DMZ.
** acto seguido hace ssh y entra en servidor DMZ aprovechándose de la regla creada por el servidor SPA.

NOTAS:
* El vídeo resultante mostrará la creación y posterior eliminación al cabo de unos segundos de la regla temporal en el firewall para permitir el acceso por ssh a server DMZ desde un equipo situado en Internet.
* El acceso por ssh al servidor dmz debe hacerse a través de a IP pública del FW (192.0.2.254)
* La red 192.0.2.0/24 se considera una red de Internet.

### Squid: control de acceso (máx 0,35 ptos en la Ev.)
Resuelve el siguiente ejercicio
* squid_practica_2_enunciado_tarea_distancia.pdf squid_practica_2_enunciado_tarea_distancia.pdf

### HAproxy: algoritmos de balanceo, check y estadísticas (máx 0,3 ptos en la Ev.)

Resuelve el siguiente ejercicio: 
* haproxy_practica_2_enunciado_tarea_distancia.pdf

