#!/bin/bash

bash close_ports.sh

podman stop -a

sudo rm -rf ./hosts/*

echo 0 > index