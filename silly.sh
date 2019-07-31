#!/bin/bash


echo "This is a ldap installation script" > /tmp/silly.txt


sudo apt update -y
sudo apt install -y slapd ldap-utils

