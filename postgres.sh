#!/bin/bash

# ASCII art

# Log: Starting installation of PostgresDB
echo "Starting installation of PostgresDB..."

# Install PostgresDB
sudo apt update
sudo apt install postgresql postgresql-contrib

# Log: PostgresDB installed successfully
echo "PostgresDB installed successfully."

# Log: Creating new user dotworld
echo "Creating new user dotworld..."

# Generate a random password
PASSWORD=$(openssl rand -base64 12)

# Create new user dotworld with the generated password
sudo -u postgres psql -c "CREATE USER dotworld WITH PASSWORD '$PASSWORD' SUPERUSER;"

# Log: New user dotworld created successfully
echo "New user dotworld created successfully."

# Log: Password for new user dotworld is printed below
echo "Password for new user dotworld is: $PASSWORD"

# Log: Script execution completed
echo "Script execution completed."
