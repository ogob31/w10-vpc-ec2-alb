#!/bin/bash

# Update packages
sudo yum update -y

# Install Apache HTTP Server
sudo yum install httpd -y

# Start and enable Apache to run on boot
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a simple HTML page to identify the server
sudo bash -c 'echo "<html><body style=\"background-color: #7D3FAF;\"><h1>Web page served from: <span style=\"color: purple;\">$(hostname)</span></h1></body></html>" > /var/www/html/index.html'
