#!/bin/bash
set -veu
mkdir "$HOME/.local"
echo 'export PATH="$HOME/.local:$PATH"' >> .bashrc
echo "update & upgrade ubuntu packages"
apt-get update && apt-get upgrade -y
cd ~
echo "installing python3"
apt-get install python3 python3-dev -y
echo "installing nodejs"
apt-get install nodejs
echo "installing openjdk-11-jdk"
apt-get install openjdk-11-jdk -y
echo "java --version"
echo "installing maven"
apt-get install maven -y
echo "mvn -version"
echo "installing git"
apt-get install git-all -y
echo "git --version"
echo "installing github large files"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
echo "install podman"
apt-get install podman -y
echo "install docker"
apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y
echo "install docker credential gcr"
curl -L -o docker-credential-gcr.tar.gz https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v2.1.1/docker-credential-gcr_linux_amd64-2.1.1.tar.gz
tar -xvzf docker-credential-gcr.tar.gz
echo "install yj"
curl -L -o yj https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-amd64
chmod +x yj
mv yj /usr/local/bin/yj
echo "install yq"
curl -L -o yq https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_amd64
chmod +x yq
mv yq /usr/local/bin/yq
echo "install ytt"
curl -L -o ytt https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.40.1/ytt-linux-amd64
chmod +x ytt
mv ytt /usr/local/bin/ytt
echo "update & upgrade ubuntu packages"
apt-get update && apt-get upgrade -y
echo "happy wife happy life"
apt-get autoclean && apt-get autoremove -y
