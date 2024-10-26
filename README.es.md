[![Lang en](https://img.shields.io/badge/lang-en-blue?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.md)
[![Lang es](https://img.shields.io/badge/lang-es-red?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.es.md)

## Tabla de contenidos

- [Acerca de este repositorio](#Acerca-de-este-repositorio)
- [Prerrequisitos](#Prerrequisitos)
- [Uso](#Uso)

## Acerca de este repositorio

Probado en Windows 10.  
Convierte varios videos de tu elección con **ffmpeg**. Puedes cambiar la siguiente línea 
si deseas otro tipo de conversión o configuración para tus vídeos:

``ffmpeg -i "$file" -c:v libx264 -c:a copy "$output"``

Mantén "$file" y "$output" tal y como están.

Para más información echa un vistazo a la documentación de **ffmpeg**: [link](https://ffmpeg.org/ffmpeg.html)

## Prerrequisitos

**ffmpeg** necesita estar instalado en tu ordenador.

1. Descarga **ffmpeg**.
2. Descomprime **ffmpeg**.
3. Copia todos los archivos de *bin* a una carpeta de tu elección.
4. Añade **bin** a las variables de entorno de **Path**.

## Uso

1. Preguntará si estás en el directorio correcto (contesta con Y o N). Si no es así, escribe la ruta y automáticamente 
cambiará a la que hayas escrito.
2. Preguntará si la siguiente configuración es correcta, elige [1] o [2].
3. Preguntará que escribas un nombre de archivo. Preguntará por cada archivo de esta ruta.
4. Si no quieres la conversión por defecto que tengo escrita, abre este archivo con cualquier edit de texto y haz un cambio. 
Mira el punto **Acerca de este repositorio** para la documentación de ffmpeg.
5. Si deseas cancelar el programa, presiona **CTRL+C**.

Ejemplo:

- Estás en **C:\Descargas** pero tus vídeos están en **G:\Descargas\Peliculas**, así que contesta con **N**
- Escribe **G:\Descargas\Peliculas**
- Preguntará de nuevo. Estás en **G:\Descargas\Peliculas**, así que esta vez contesta con **Y**
- Escribe **2** cuando te pregunte si la configuración es correcta.
- Escribe **pelicula01.mp4** y la convertirá de **MiPelicula.mkv** a **pelicula01.mp4**
- Para cualquier archivo restante, repetirá este punto anterior.