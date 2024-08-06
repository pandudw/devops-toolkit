#!/bin/bash

sudo apt update
sudo apt install -y zsh git curl

curl -LO https://dl.k8s.io/release/$(curl -L https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

curl -Lo kubens https://raw.githubusercontent.com/ahmetb/kubens/master/kubens
chmod +x kubens
sudo mv kubens /usr/local/bin/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl kubectx)
export plugins

chsh -s /bin/zsh
