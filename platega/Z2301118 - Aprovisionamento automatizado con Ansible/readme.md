# Curso de Aprovisionamento automatizado con Ansible

## Titor
José Luis Rojas

## Estrutura
O curso está estruturado en 4 temas (1 por semana). 

Hai contidos que resultan esenciais para a realización das tarefas pero outros, non. 

Un consello é botar unha ollada o enunciado das tarefas antes de comezar co tema: así saberemos con antelación o que se vos pide para superar o módulo. E, polo tanto, os puntos onde vos debedes centrar.
## Motivación
Ola, chámome Xoán e acabo de ser destinado no IES do Xílgaro.

Xunto cun equipo de compañeiros ecargámonos do mantemento informático do centro.

A situación actual do centro é a seguinte:
- Temos varios equipos conectados en rede, repartidos por distintas aulas e departamentos.
- Temos equipos con Sistemas Operativos tanto Windows como GNU/Linux.
- As configuracións dos equipos de cada aula varia: Software instalado, configuracións ...

Isto presenta moitos problemas:
- Cada vez que temos que instalar un novo software nun equipo leva moitísimo tempo, xa que temos que ir equipo por equipo
- Pasa o mesmo cando temos que aplicar unha nova configuración a un programa.

Sería interesante:
- Dispoñer de algún tipo de software que nos permitise dende un servidor centralizado despregar aplicacións, configuracións,etc ... dun xeito totalmente desantendido sobre un equipo ou un grupo de equipos. É dicir, dispoñer de algún tipo de software de orquestación.

Nas seguintes presentacións xustificaremos como mellorar a organización informática do noso centro, e veremos como implementalo.

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
