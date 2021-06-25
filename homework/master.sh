#!/bin/bash
#Master node install

sudo apt-get update && sudo apt-get install -y docker.io nfs-common dnsutils curl

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="\
--disable traefik \
--disable metrics-server \
--node-name master --docker" \
INSTALL_K3S_VERSION="v1.18.6+k3s1" sh -s -

mkdir -p ~/.kube
cd ~/.kube/

sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown -R $(id -u):$(id -g) ~/.kube

echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc

#Verify

#kubectl cluster-info
#kubectl get node -o wide
