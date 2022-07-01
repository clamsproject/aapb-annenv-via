# VIA annotation environment for CLAMS-AAPB project 

This repository contains a dockerized version of [VIA 3](https://www.robots.ox.ac.uk/~vgg/software/via/). It is configurable for different video annotation projects. 

## Prerequisite

* `docker` for running the VIA environment
* (optional) `git` for uploading ann files to annotation collection repository

## How to run 

From you terminal, 
1. Clone this repository into local disk
    ```
    git clone https://github.com/clamsproject/aapb-annenv-via.git
    cd aapb-annenv-via 
    ```
1. See inside `configs` directory and check if there's a subdirectory of which name matches to the project name to work on.
    ```
    ls configs/
    ```
1. The Dockerized VIA instance requires a directory for storing the project files. The first time you use the tool create a new directory for storing the files using the command `mkdir via_data`
   
2. Start up the via environment using the command `start.sh`
    ```
    ./start.sh <project_name> <via_data_directory> <media_directory> 
    ```
    * To avoid any space related to issues, we recommend using project names and data directory names WITHOUT any spaces in them. 
    * data directory should contains all video files in a subdirectory named `video` to annotate and all those files MUST have names end with `.mp4`. 
    * VIA will be running as a web app, and can be accessible at `http://localhost:8080/`. To change the port, edit `-p` line in the `start.sh`
3. For the tool itself, please refer to the [VIA Documentation](https://www.robots.ox.ac.uk/~vgg/software/via/) for more detailed usage. 
4. While annotating, save your work periodically using the cloud upload button.
5. When done, go back to terminal and hit `ctrl+c`. It will take seconds to shut down via. For security reasons, it is recommended that one shutdown via after every work session, first saving your work using the cloud upload button.
6. (Optionally) Once annotation is done (fully or partly), use `upload.sh` to upload the annotation files to the annotation collection repository on the github.
    ```
    ./upload.sh <project_name>
    ```
