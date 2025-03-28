# Lista de Tareas
## Descripción del proyecto:

Este proyecto consiste en la implementación de un laboratorio práctico desarrollado en Ruby, con el objetivo de diseñar y construir un programa que permita a los usuarios gestionar de manera eficiente un listado de tareas. La aplicación proporcionará funcionalidades clave para registrar, almacenar, actualizar y visualizar las tareas, fomentando la organización y productividad del usuario. 

Nota: Es importante que si quiere cargar un archivo, debe de estar en el mismo repositorio en donde está ubicado el proyecto

## Clases y Métodos

```python
#Clases

TaskList() = #Clase principal en donde abarcará todos los métodos necesarios para crear, eliminar, verificar, guardar y cargar tareas.

#-----------------------------------------------------------------------------------------------------------------------------------------------
#Métodos de clase

agregar_tareas() = #Este método permitirá la creación de tareas. Aquí es donde el usuario indicará el nombre y descripción de tareas. Además, el programa realizará una serie de operaciones para calcular el tiempo y el estado de la tarea.

completar_tareas() = #Este método permitirá que el usuario pueda completar la tarea a escoger.

ver_tareas() = #En este método, permitirá verificar todas las tareas disponibles ya sean pendientes o completadas que haya ingresado el usuario.

eliminar_tareas() = #En este método, permitirá la eliminación de datos de una tarea en base a un diccionario.

guardar_tareas() = #En este método, permitira guardar las tareas que haya ingresado el usuario en un archivo. Para guardar tareas es importante escribir el nombre del archvio sin el tipo de formato, ejemplo: .txt, .json entre otros formatos.

cargar_tareas() = #En este método, permitirá cargar las tareas que haya en un archivo. Es importante mantener una estructura precisa para que la carga sea exitosa. el formato debe ser el siguiente: nombre|descripción|estado|creado_en|finalizada_en

```

## Funciones Adicionales

```Python

#Funciones Principales:

limpiar_pantalla() = #Esta función permitirá realizar una búsqueda si el sistema operativo es linux o windows. Según el análisis, borrará la terminal. Es una función para mejorar la visualidad del programa.

menu() = #En esta función, se desplegará el menu. 

main() = #Esta función es la principal fuente del programa en donde abarcará case-when y demás. 

```

## Desarrollador

Christian Matias
