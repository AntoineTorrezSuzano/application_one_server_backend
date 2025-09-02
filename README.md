# Project application_one_server_backend 
This projet is the backend of the application_one Rust App (Windows 10/11)
It is originaly runned on a Rocky Linux 10, it has not been tested on other Linux district
it require the use of Bash files (.sh), python and pip (a venv is provided to run correctly `api_server.py` with `run_after_git_clone.sh` file) and podman which is an alternative of Docker since Rocky Linux 10 is too recent to use Docker

To install podman on Rocky Linux 10, follow this link : https://podman.io/docs/installation

## Core Info
This project goal is to host locally website with an only .html file, it works with the launch of the bash file `new_host.sh <parameter1>` 

There is an Api Server that can be launched with the `api_server.py` file, for it to run you need to first run the bash file `run_after_git_clone.sh`
This API server accept only a POST request at the `/deploy` end with a `Content-Type` `application/json` and this `body` structure :
```JSON
{
 "html_content": "<h3>\"No one saves us but ourselves. No one can and no one may. We ourselves must walk the path\"</h3>"
}
```

## hosts/
This is the folder containing all the hosted website folders

## html/
This is a simple template, nothing important

## .gitignore
This is the gitignore 

## api_server.py
This is the api server that have to run if you want the rust application to fully works

## close_ports.sh
This bash file close the ports used by each containers

## close_ports.v2.sh
This bash file close the ports that are used between `6001` and `6124`

## complete_hosting_reset.sh
This file... 
- close all the used port between `6001` and `6124`
- stops all the container running
- delete everything inside the `hosts/` folder
- Set the index file content to `0`

## Dockerfile
This is the image constructor file, it's image is used by the `new_host.sh` file

## index
This is a simple file with a value in it that get changed everytimes `newhost.sh` file get runned

## new_host.sh
This file run a new container with a new name and a port that isn't used, it create a new folder inside of the `hosts/` folder containing an `index.html` file

## README.md
This file explain the project, where and how to use it and the purpose and actions of each files inside the folder it is placed

## requirements.txt
This file lists the python environement's dependencies, it is used by the `run_after_git_clone.sh`

## run_after_git_clone.sh
This file have to be runned avec cloning the projet from git

## run_api_server.sh
This file simply the the `api_server.py` file in sudo

## utils.sh
This file contains a bash function used by the `new_host.sh` file

