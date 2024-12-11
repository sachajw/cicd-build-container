#!/bin/bash
set -veu

# Variables
LOCAL_DIR="$HOME/.local"
BASHRC="$HOME/.bashrc"

# Create local bin directory and update PATH
mkdir -p "$LOCAL_DIR"
echo 'export PATH="$HOME/.local:$PATH"' >> "$BASHRC"

# Update and upgrade system packages
echo "Updating and upgrading Ubuntu packages..."
apt-get update && apt-get upgrade -y

# Install curl
echo "Installing Curl..."
apt-get install curl -y

# Install Python3 and development tools
echo "Installing Python3..."
apt-get install -y python3 python3-dev

# Install SDKMAN and Java
echo "Installing SDKMAN and Java..."
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk env init && sdk env
java --version

# Install Maven
echo "Installing Maven..."
apt-get install -y maven
mvn -version

# Install Git
echo "Installing Git..."
apt-get install -y git-all
git --version

# Install Git Large File Storage (LFS)
echo "Installing Git LFS..."
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

# Install Docker
echo "Installing Docker..."
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Credential Helper for GCR
echo "Installing Docker Credential Helper for GCR..."
curl -L -o docker-credential-gcr.tar.gz https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v2.1.1/docker-credential-gcr_linux_amd64-2.1.1.tar.gz
tar -xvzf docker-credential-gcr.tar.gz -C /usr/local/bin

# Install yj
echo "Installing yj..."
curl -L -o /usr/local/bin/yj https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-amd64
chmod +x /usr/local/bin/yj

# Install yq
echo "Installing yq..."
curl -L -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_amd64
chmod +x /usr/local/bin/yq

# Install ytt
echo "Installing ytt..."
curl -L -o /usr/local/bin/ytt https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.40.1/ytt-linux-amd64
chmod +x /usr/local/bin/ytt

# Final system cleanup
echo "Performing final cleanup..."
apt-get update && apt-get upgrade -y
apt-get autoclean && apt-get autoremove -y

echo "Setup complete. Happy coding!"
