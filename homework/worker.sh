#!/bin/bash

NODE_TOKEN="K10c2340be1fccca22c81f8f14ae6387bae6a7792f5729269f50389fbf2345dd02e::server:2896d9ec3ba3f2cd4f671b65c16992f2"
MASTER_IP="10.0.2.100"

#sudo apt-get update && sudo apt-get install -y docker.io nfs-common curl

curl -sfL https://get.k3s.io | K3S_URL\https://$MASTER_IP:6443 \
K3S_TOKEN=$NODE_TOKEN \
INSTALL_K3S_EXEC="--node-name worker --docker" \
INSTALL_K3S_VERSION="v1.18.6+k3s1" sh -s -

