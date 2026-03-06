Dodge the Creeps – Proyecto de Juego en Godot 4
Descripción General

Este proyecto consiste en un juego arcade en 2D desarrollado utilizando el motor de videojuegos Godot 4. El jugador controla un personaje cuyo objetivo es evitar enemigos ("mobs") que aparecen continuamente en la pantalla. Mientras más tiempo sobreviva el jugador sin colisionar con los enemigos, mayor será la puntuación obtenida.

El juego está basado en el tutorial clásico "Dodge the Creeps", el cual introduce conceptos fundamentales del desarrollo de videojuegos en Godot, tales como:

Organización de escenas y nodos

Manejo de entrada del jugador

Detección de colisiones

Generación aleatoria de enemigos

Sistema de puntuación

Interfaz de usuario (HUD)

Control del estado del juego

Además de la implementación base del tutorial, el proyecto incluye mejoras adicionales como:

Un sistema de configuración externa para parámetros del juego

Control de versiones mediante Git y GitHub

Una estructura organizada del proyecto para facilitar su mantenimiento

Este repositorio contiene todo el código fuente y los recursos necesarios para ejecutar el juego localmente.

Estructura del Proyecto

El repositorio está organizado de la siguiente manera:

project-root/
│
├── art/                # Recursos gráficos del juego (sprites, fuentes, etc.)
├── config/             # Archivos de configuración del juego
│   └── config.default.cfg
│
├── scripts/            # Scripts del juego
│   └── Config.gd
│
├── Main.tscn           # Escena principal del juego
├── Player.tscn         # Escena del jugador
├── Mob.tscn            # Escena de los enemigos
├── HUD.tscn            # Escena de la interfaz de usuario
│
├── project.godot       # Archivo de configuración del proyecto de Godot
└── README.md           # Documentación del proyecto
Requisitos

Antes de ejecutar el proyecto, asegúrate de tener instalado el siguiente software en tu sistema.

Motor Godot

Este proyecto fue desarrollado utilizando:

Godot Engine 4.x

Se recomienda utilizar Godot 4.2 o una versión superior para asegurar la compatibilidad completa con el proyecto.

Puedes descargar Godot desde el sitio oficial:

https://godotengine.org/download

No se requieren librerías adicionales ni dependencias externas.

Cómo Ejecutar el Proyecto

Sigue los pasos a continuación para ejecutar el juego en tu computadora.

1. Clonar el Repositorio

Primero, clona el repositorio desde GitHub utilizando Git:

git clone https://github.com/TU_USUARIO/TU_REPOSITORIO.git

Luego ingresa a la carpeta del proyecto:

cd TU_REPOSITORIO

Alternativamente, puedes descargar el repositorio como archivo ZIP y extraerlo manualmente en tu computadora.

2. Abrir el Proyecto en Godot

Ejecuta el motor Godot.

En el administrador de proyectos de Godot:

Haz clic en Importar.

Navega hasta la carpeta donde clonaste o extrajiste el repositorio.

Selecciona el archivo:

project.godot

Haz clic en Importar y editar.

Godot cargará automáticamente todas las escenas y recursos del proyecto.

3. Ejecutar el Juego

Una vez que el proyecto esté abierto en el editor de Godot:

Presiona el botón Play (▶) ubicado en la parte superior derecha del editor.

o

Usa el atajo de teclado:

F5

Esto ejecutará la escena principal del juego.

Controles del Juego

Utiliza las flechas del teclado para mover al personaje.

Evita colisionar con los enemigos que aparecen en la pantalla.

La puntuación aumenta automáticamente mientras el jugador permanece con vida.

Si el jugador colisiona con un enemigo, el juego termina.

El objetivo del juego es sobrevivir el mayor tiempo posible y alcanzar la puntuación más alta.

Sistema de Configuración

El proyecto incluye un sistema de configuración que permite separar ciertos parámetros del juego del código fuente.

Las configuraciones se encuentran en el archivo:

config/config.default.cfg

Este archivo contiene parámetros configurables como:

velocidad del jugador

rango de velocidad de los enemigos

frecuencia de aparición de enemigos

intervalo de incremento del puntaje

Cuando el juego se ejecuta por primera vez, se genera automáticamente un archivo de configuración del usuario en:

user://config.cfg

Esto permite modificar parámetros del juego sin necesidad de editar directamente el código del proyecto.

Control de Versiones

Este proyecto utiliza Git como sistema de control de versiones y GitHub como repositorio remoto.

El control de versiones permite:

registrar cambios en el código del proyecto

mantener un historial de modificaciones

recuperar versiones anteriores en caso de errores

facilitar la colaboración en equipo

El repositorio incluye un archivo .gitignore que evita subir archivos generados automáticamente por el motor Godot.

Propósito Educativo

Este proyecto fue desarrollado con fines educativos como parte de una asignatura orientada al aprendizaje de fundamentos del desarrollo de videojuegos utilizando Godot.

Entre los conceptos abordados se encuentran:

estructura de escenas en Godot

control del flujo del juego

sistemas de entrada del jugador

detección de colisiones

implementación de interfaces de usuario

organización y arquitectura de proyectos de videojuegos

Licencia

Este proyecto está destinado principalmente a fines educativos.
Los recursos gráficos incluidos en el repositorio pertenecen a sus respectivos autores y se utilizan de acuerdo con sus licencias correspondientes.
