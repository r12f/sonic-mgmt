#!/bin/bash

USER="admin"
PASSWORD="YourPaSsWoRd"
DPU_IP="10.250.0.55"

if ! which sshpass > /dev/null; then
    echo "sshpass is not installed. Installing it..."
    sudo apt-get install -y sshpass
fi

echo "Installing all scripts to DPU..."
sshpass -p $PASSWORD scp dpu_scripts/* $USER@$DPU_IP:
