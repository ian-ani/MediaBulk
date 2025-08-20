[![Lang en](https://img.shields.io/badge/lang-en-blue?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.md)
[![Lang es](https://img.shields.io/badge/lang-es-red?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.es.md)

## Tabla de contenidos

- [Acerca de este repositorio](#Acerca-de-este-repositorio)
- [Prerrequisitos](#Prerrequisitos)
- [Uso](#Uso)

## Acerca de este repositorio

Probado en Windows 10.  
Convierte varios videos de tu elección con **ffmpeg**, también se puede extraer el audio de los archivos de vídeo.

Para más información echa un vistazo a la documentación de **ffmpeg**: [link](https://ffmpeg.org/ffmpeg.html)

## Prerrequisitos

**ffmpeg** necesita estar instalado en tu ordenador.

1. Descarga **ffmpeg**.
2. Descomprime **ffmpeg**.
3. Copia todos los archivos de *bin* a una carpeta de tu elección.
4. Añade **bin** a las variables de entorno de **Path**.

Para que funcione este script, ya que PowerShell puede ser un poco estricto con algunos scripts, necesitas activar esto antes:

``Set-ExecutionPolicy RemoteSigned -Scope CurrentUser``

Y para desactivarlo una vez hayas terminado:

``Set-ExecutionPolicy Restricted -Scope CurrentUser``

## Uso

1. Arranca:
    - Para la conversión de vídeo: **Convert-Video.ps1**
    - Para la extracción de audio: **Extract-Audio.ps1**
2. Uso:
    - Vídeos: `.\Convert-Bulk.ps1 C:\Videos libx264`  
    (Si se omite el [códec](https://ffmpeg.org/ffmpeg-codecs.html#Video-Decoders), se usará **libx264** por defecto)

    - Audio: `.\Extract-Audio.ps1 C:\Music flac`  
    (Si se omite el [códec](https://ffmpeg.org/ffmpeg-codecs.html#Audio-Encoders), se usará **libmp3lame** por defecto)
3. Elige el nombre del archivo de salida, como por ejemplo, *video.mp4*.
