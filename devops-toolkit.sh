#!/bin/bash

sudo apt update
sudo apt install -y zsh git curl python3-pip

# ====================================================================
# Install kubectl
# ====================================================================
curl -LO https://dl.k8s.io/release/$(curl -L https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# ====================================================================
# Install kubectx and kubens
# ====================================================================
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# ====================================================================
# Install helm
# ====================================================================
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# ====================================================================
# Install kustomize
# ====================================================================
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# ====================================================================
# Install terraform
# ====================================================================
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
sudo apt update
sudo apt-get install terraform

# ====================================================================
# Install ansible 
# ====================================================================
python3 -m venv venv
source venv/bin/activate 
pip install ansible
