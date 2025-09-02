#!/bin/bash
source ./utils.sh

filecontent=$1
index=$(cat index); ((index++)); echo $index > index
container_port=80
host_ip=$(hostname -I | awk '{print $1}')
host_port=$(find_available_ports_in_range 6001 10000 1)

# echo "Building Podman image 'host-website-image'"

# podman build -t host-website-image .

mkdir ./hosts/website-$index
# cp ./html/index.html ./hosts/website-$index/
echo $filecontent >> ./hosts/website-$index/index.html

# echo "Running container 'web-$index' from 'host-website-image'"

podman run --rm -d --name "web-$index" -p $host_port:$container_port -v ./hosts/website-$index:/usr/share/nginx/html:ro,Z host-website-image > /dev/null
# podman run --rm -d --name "web-$index" -p $host_port:$container_port -v .:/usr/share/nginx/html:ro,Z docker.io/library/nginx

sudo firewall-cmd --permanent --add-port=$host_port/tcp > /dev/null
sudo firewall-cmd --reload > /dev/null

# echo "Container 'web-$index' is now running. It will be automatically deleted when stopped."
# echo "You can access your Nginx server at http://$host_ip:$host_port"
echo "http://$host_ip:$host_port"
# echo "To stop the container, use: podman stop web-$index"