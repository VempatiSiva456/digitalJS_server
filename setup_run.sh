#!/bin/bash

# Update and install Yosys
echo "Installing Yosys..."
sudo apt-get update
sudo apt-get install -y yosys

# Install npm packages
echo "Installing npm packages..."
npm install
npm install digitaljs

# Start server and client
echo "Starting server on localhost:8080..."
npm run server & 
SERVER_PID=$!

echo "Starting client on localhost:3000..."
npm run dev &
CLIENT_PID=$!

# Wait for user input to terminate
read -p "Press any key to stop the server and client..."

# Kill server and client
kill $SERVER_PID
kill $CLIENT_PID
echo "Server and client stopped."
