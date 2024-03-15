#!/bin/bash

# Ensure rsyslog is installed
sudo apt-get update
sudo apt-get install -y rsyslog

# Enable receiving logs on TCP and UDP
sudo sed -i 's/#module(load="imtcp")/module(load="imtcp")/' /etc/rsyslog.conf
sudo sed -i 's/#input(type="imtcp" port="514")/input(type="imtcp" port="514")/' /etc/rsyslog.conf

sudo sed -i 's/#module(load="imudp")/module(load="imudp")/' /etc/rsyslog.conf
sudo sed -i 's/#input(type="imudp" port="514")/input(type="imudp" port="514")/' /etc/rsyslog.conf

# Restart rsyslog to apply changes
sudo systemctl restart rsyslog
