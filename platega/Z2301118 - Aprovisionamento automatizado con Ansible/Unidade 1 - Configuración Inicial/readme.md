# UD 1

## Alternativas de Instalación

Dado que este tema precisa a configuración de numerosas Máquinas virtuais ofrecemos dous xeitos de realizalo

### Versión Completa

Consiste en ir realizando todos os pasos descritos na documentación (1.1, 1.2, 1.3 ... )

### Versión simplificada

Proporcionamos unha .ova de Virtualbox coa imaxe da Máquina Virtual Debian plantilla que será a base de todos as MV Debian que crearemos no curso

Podemos importar o arquivo .ova co que evitaremos ter que realizar toda a instalación de Debian

Se optamos por esta vía, os pasos a seguir serían:
1. Crear Rede Xilgaro no VirtualBox como se ve en 1.2-Laboratorio de probas ->    Diapos5
2. Importar MV Debian Plantilla
3. Creación a partir da plantilla importada mediante clonación enlazada das seguintes Máquinas Virtuais
-- ServidorAnsible
-- IF1-01
4. Habilitamos arranque dende o disco duro das MV clonadas (servidorAnsible, IF1-01)
5. Configuramos as MV's como se indica na presentación 1.5
6. Instalación de Ansible e primeiros pasos   

Da igual cal sexa a opción escollida, o producto final o rematar a presentación 1.6 será o mesmo
