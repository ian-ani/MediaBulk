[![Lang en](https://img.shields.io/badge/lang-en-blue?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.md)
[![Lang es](https://img.shields.io/badge/lang-es-red?style=flat)](https://github.com/ian-ani/Convert-Bulk/blob/main/README.es.md)

## Table of contents

- [About the project](#About-the-project)
- [Pre-requisites](#Pre-requisites)
- [Usage](#Usage)

## About the project

Tested on Windows 10.  
Converts various videos of your choice with **ffmpeg**. You can change this line if you wish 
another type of conversion or configuration for your videos:

``ffmpeg -i "$file" -c:v libx264 -c:a copy "$output"``

Leave "$file" and "$output" as is.

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

1. It will ask if you are in the correct folder (answer with Y or N). If not, write your path and it will automatically change
to the one you choose.
2. It will ask if this configuration is correct, choose [1] or [2].
3. It will ask you to input a filename. It will ask for every file in this path.
4. If you don't want my default conversion, open this file with any text editor and change it. See point *About the project* for ffmpeg docs.
5. If you want to cancel it, press **CTRL+C**.

Example:

- You're in **C:\Downloads** but your videos are in **G:\Downloads\Movies**, so when prompted answer with **N**
- Write **G:\Downloads\Movies**
- It will ask again. You're in **G:\Downloads\Movies**, so this time answer with **Y**
- Answer **2** when prompted asking about the configuration.
- Write **movie01.mp4** and it will convert **MyMovie.mkv** to **movie01.mp4**
- For any remaining files, it will repeat the last point.