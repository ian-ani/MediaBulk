[![Lang en](https://img.shields.io/badge/lang-en-blue?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.md)
[![Lang es](https://img.shields.io/badge/lang-es-red?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.es.md)

## Table of contents

- [About the project](#About-the-project)
- [Pre-requisites](#Pre-requisites)
- [Usage](#Usage)

## About the project

Tested on Windows 10.  
Converts various videos of your choice with **ffmpeg**, or extracts audio from video files.

For more information see **ffmpeg** docs: [link](https://ffmpeg.org/ffmpeg.html)

## Pre-requisites

**ffmpeg** needs to be installed on your computer.

1. Download **ffmpeg**.
2. Unzip **ffmpeg**.
3. Copy all the files from *bin* to a folder of your choice.
4. Add *bin* to your **Path** environment variables.

For this script to work, as PowerShell might be quite strict with some scripts, you need to activate this first:

``Set-ExecutionPolicy RemoteSigned -Scope CurrentUser``

And to deactivate it once you're done:

``Set-ExecutionPolicy Restricted -Scope CurrentUser``

## Usage

1. Run:
    - Convert videos: **Convert-Video.ps1**
    - Extract audio: **Extract-Audio.ps1**
2. Usage:
    - Videos: `.\Convert-Bulk.ps1 C:\Videos libx264`   
    (If you omit the [codec](https://ffmpeg.org/ffmpeg-codecs.html#Video-Decoders), **libx264** will be set by default)

    - Audio: `.\Extract-Audio.ps1 C:\Music flac`  
    (If you omit the [codec](https://ffmpeg.org/ffmpeg-codecs.html#Audio-Encoders), **libmp3lame** will be set by default)
3. Choose a name for the output file, such as *video.mp4*.