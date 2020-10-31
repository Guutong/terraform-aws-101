#!/bin/bash
# initial env for running
sudo apt update
sudo apt install -y nginx

# load script
wget https://www.dropbox.com/s/0tfji09xogep6c4/index.html
sudo mv index.html /var/www/html/