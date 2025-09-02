## hosts/
This is the folder containing all the hosted website folders

## html/
This is a simple template, nothing important

## close_ports.sh
This bash file close the ports used by each containers

## Dockerfile
This is the image constructor file, it's image is used by the `new_host.sh` file

## index
This is a simple file with a value in it that get changed everytimes `newhost.sh` file get runned

## new_host.sh
This file run a new container with a new name and a port that isn't used, it create a new folder inside of the `hosts/` folder containing an `index.html` file

## README.md
This file explain the purpose and actions of each files inside the folder it is placed

## utils.sh
This file contains a bash function used by the `new_host.sh` file