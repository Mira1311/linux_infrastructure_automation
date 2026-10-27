#!/bin/bash

# Resets ufw to wipe out any existing messy rules
sudo ufw --force reset
# Sets the default policy to deny all incoming traffic
sudo ufw default deny incoming
# Sets the default policy to allow all outgoing traffic
sudo ufw default allow outgoing
# Explicitly allows SSH ( Port 22/tcp )
sudo ufw allow 22/tcp
# Explicitly allows HTTP (Port 80/tcp )
sudo ufw allow 80/tcp
# Enables the firewall 
sudo ufw --force enable
# Prints the verbose status on the end
sudo ufw status verbose


