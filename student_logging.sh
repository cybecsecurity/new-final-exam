#!/bin/bash

# Setup command logging
echo "export PROMPT_COMMAND='RETRN_VAL=\$?;logger -p local6.debug \"\$(whoami):\$(history 1 | sed \"s/^[ ]*[0-9]\+[ ]*//\" )[\$RETRN_VAL]\"'" | sudo tee -a /etc/bash.bashrc

# Ensure rsyslog is installed
sudo apt-get update
sudo apt-get install -y rsyslog

# Configure rsyslog to forward logs
echo "*.* @@exam.azerbaijancybersecurity.center:514" | sudo tee /etc/rsyslog.d/99-forward.conf

# Restart rsyslog to apply changes
sudo systemctl restart rsyslog