#!/bin/bash

# Get the username from prompt
read -p "Enter username: " username

# Create new user
useradd -m "$username"

usermod -aG sudo "$username"
usermod --shell /bin/bash "$username"

# Copy authorized keys from root to newly created user
mkdir -p /home/$username/.ssh
cp ~/.ssh/authorized_keys /home/$username/.ssh/
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys

# Give user sudo access and edit visudo
echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$username

# Turn off password authentication
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Disable root login
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

# Restart ssh service
service ssh restart