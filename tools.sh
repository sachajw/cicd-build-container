#!/bin/bash
set -veu

# Variables
LOCAL_DIR="$HOME/.local"
BASHRC="$HOME/.bashrc"
SDKMAN_CANDIDATES_API="https://api.sdkman.io/2"
SDKMAN_DIR="$HOME/.sdkman"
ZSH_SHELL="false"
BASH_SHELL="true"

# Create local bin directory and update PATH
mkdir -p "$LOCAL_DIR"
echo 'export PATH="$HOME/.local:$PATH"' >> "$BASHRC"

# Update and upgrade system packages
echo "Updating and upgrading Ubuntu packages using a local mirror..."
sed -i.bak -e 's|http://archive.ubuntu.com/ubuntu/|http://<mirror-url>/ubuntu/|g' /etc/apt/sources.list
echo "Switched to local mirror for faster package downloads."
apt-get update && apt-get upgrade -y

# Install essential packages
echo "Installing essential packages..."
apt-get install -y python3 python3-dev maven git-all podman \
    ca-certificates curl gnupg lsb-release unzip zip

# Install SDKMAN and Java
echo "Installing SDKMAN and Java..."
if [ ! -d "$SDKMAN_DIR" ]; then
    curl -s "https://get.sdkman.io" | bash
else
    echo "SDKMAN is already installed. Skipping installation."
fi
export SDKMAN_CANDIDATES_API="$SDKMAN_CANDIDATES_API"
export SDKMAN_DIR="$SDKMAN_DIR"
export ZSH_SHELL="$ZSH_SHELL"
export BASH_SHELL="$BASH_SHELL"
source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk install java
sdk env init && sdk env
java --version

# Install Git Large File Storage (LFS)
echo "Installing Git LFS..."
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

# Install Docker
echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Enable Docker service
# systemctl enable docker
# systemctl start docker

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
