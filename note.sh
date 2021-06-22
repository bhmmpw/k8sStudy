#!/bin/bash

exit 0

민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:01
안녕하세요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:01
안녕하세요.
신동렬 님이 모두에게:    오전 8:02
안녕하세요.
신동렬 님이 모두에게:    오전 8:26
고가용성 클러스터 생성 그림은 단일 클러스터에 다수의 Master를 두는 것 처럼 보여집니다. stacked etcd cluster를 직접 구성할 경우 etcd 간의 싱크는 어떻게 맞추어야 하나요? 
신동렬 님이 모두에게:    오전 8:27
마스터가 많아지면 많아질 수록 싱크 맞추기가 더 어렵지 않을까? 라는 생각이 들어서 문의드립니다. 
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:29
하나의 클러스터에 복수의 마스터가 가능한가요? node를 하나의 master에만 참여가능하지 않나요?
CTO_김성찬 님이 모두에게:    오전 8:36
aws ec2 기반으로는 실습이 어려운지요?
CTO_김성찬 님이 모두에게:    오전 8:39
virtualbox 네트워크 설정이 해결되지 않아 문의 드렸습니다
강사 김대경 님이 모두에게:    오전 8:43
/usr/local/bin/k3s-uninstall.sh
강사 김대경 님이 모두에게:    오전 8:44
sudo apt update
강사 김대경 님이 모두에게:    오전 8:44
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="\
--disable traefik \
--disable metrics-server \
--node-name master --docker" \
INSTALL_K3S_VERSION="v1.20.0-rc4+k3s1" sh -s –
강사 김대경 님이 모두에게:    오전 8:46
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
강사 김대경 님이 모두에게:    오전 8:46
echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc
강사 김대경 님이 모두에게:    오전 8:47
sudo chown -R $(id -u):$(id -g) ~/.kube
강사 김대경 님이 모두에게:    오전 8:47
source ~/.bashrc
강사 김대경 님이 모두에게:    오전 8:47
sudo cat /var/lib/rancher/k3s/server/node-token
강사 김대경 님이 모두에게:    오전 8:48
kubectl get node master -ojsonpath="{.status.addresses[0].address}"
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:50
마지막 명령에서 autority 문제가 발생합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:50
Unable to connect to the server: x509: certificate signed by unknown authority
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:51
kubectl get node master -ojsonpath="{.status.addresses[0].address}"
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:51
source 배쉬 이후에요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:51
ㅣㅣ
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:52
kubectl 에서 cluster 선택이 이전꺼로 남아있어서 발생하는 이슈입니다. ~/.kube/config 지우고 다시 복사해주시면 됩니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:53
.bashrc에 export추가하는건 원래 되어있었던거고
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:53
kube폴더도 k3s:k3s로 원래부터 세팅 되어있는건데 의미있는건지요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:53
일단 다시해보겠습니다
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:54
cluster 재생성하면 연결정보에 서버인증서가 새로 생성이 됩니다. 다시 복사해주셔야 해요~
CTO_김성찬 님이 모두에게:    오전 8:55
글 작성하여 올렸습니다
CTO_김성찬 님이 모두에게:    오전 8:55
https://swedu.lge.com/qna/997
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:56
박상욱 책임님 답변 감사합니다.  해결 되었습니다
CTO_김성찬 님이 모두에게:    오전 8:57
네
CTO_김성찬 님이 모두에게:    오전 9:00
물음표로 나옵니다 (어제 여러 번 해봤어서..)
강사 김대경 님이 모두에게:    오전 9:02
/usr/local/bin/k3s-agent-uninstall.sh
강사 김대경 님이 모두에게:    오전 9:03
sudo apt update
강사 김대경 님이 모두에게:    오전 9:04
NODE_TOKEN=토큰값
강사 김대경 님이 모두에게:    오전 9:04
MASTER_IP=IP
강사 김대경 님이 모두에게:    오전 9:06
curl -sfL https://get.k3s.io | K3S_URL=https://$MASTER_IP:6443 \
K3S_TOKEN=$NODE_TOKEN \
INSTALL_K3S_EXEC="--node-name worker1 --docker" \
INSTALL_K3S_VERSION="v1.20.0-rc4+k3s1" sh -s –
신동렬 님이 모두에게:    오전 9:11
방금 말씀하신대로 구성하고자 하는거면 LB가 필요없지 않나요? 


# [[etcd-operator]]
1) git clone
2) modify deployment.yaml
3) create deployment.yaml
4) kubectl get customersourcedefinitions
5) kubectl create -f example-etcd-cluster.yaml
6) kubectl exec example-etcd-cluster-2slvlwzmxl etcdctl set test "Hello etcd!"
7) kubectl exec example-etcd-cluster-2slvlwzmxl etcdctl get test
