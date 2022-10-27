#!/bin/bash

sleep 30

# perform apt update and upgrade 
sudo apt-get update -y
#sudo apt-get upgrade 

# install nginx

sudo apt-get install nginx -y

# start nginx service

sudo systemctl start nginx
sudo systemctl enable nginx