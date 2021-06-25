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
신동렬 님이 모두에게:    오전 9:13
kubernetes용 로드밸런서는 무슨 라우팅 알고리즘 사용할까요? 
신동렬 님이 모두에게:    오전 9:13
잘 이해가 되지 않아서 문의드립니다. 로드밸런싱을 하면 
신동렬 님이 모두에게:    오전 9:13
node에서 로드밸런서의 vip호출할때마다 
신동렬 님이 모두에게:    오전 9:13
도달하는? master의 ip가 계속 바뀔텐데 
신동렬 님이 모두에게:    오전 9:14
그때마다 그럼 토큰값을 넣고 
신동렬 님이 모두에게:    오전 9:14
새로운 master에 종속되는건지 문의드리빈다. 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:16
각 노드가 종속되는 master가 지금 우리가 설정한대로 하면 자동으로 switching 되냐는 질문이신것 같은데요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:16
저도 의문입니다
신동렬 님이 모두에게:    오전 9:16
방금 구성도 사진에서는 로드밸런서에 Master노드들이 붙어서 밸런싱이 되는것처럼 보여서 문의드려봤씁니다. 
구세완 님이 모두에게:    오전 9:17
오늘 다시 인스톨한 내용이 어제 인스톨한 것과 차이를 설명해주시면 좋겠습니다.
구세완 님이 모두에게:    오전 9:20
kubectl 로 마스터노드 2개를 볼 수 없나요?
CTO_김성찬 님이 모두에게:    오전 9:20
환경 설정으로 webex 나갔다가 오겠습니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:21
master/worker1/worker2 이 리스트는 /etc/hosts에서부터 나오는건가요?
구세완 님이 모두에게:    오전 9:23
하나의 워크노드가 2개 마스터에 조인이 가능한가요?
신동렬 님이 모두에게:    오전 9:24
강사님 어제 마지막 설문조사때도 그렇고 virtualbox가 정상적으로 동작하지 않아 managed로 구성하신 분들도 있는 것으로 사려됩니다. 방금 보여주신 과제는 managed로 구성한 사람들은 어떻게 제출해야할까요? 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:25
클러스터 구성할때마다 버철박스 인스턴스 하나씩 만들어야 하는거죠?
BS_장준표 님이 모두에게:    오전 9:29
강사님 지금 수업교재 파일로 제공 가능 하신가요?
강사 김대경 님이 모두에게:    오전 9:36
cat > echo-version-blue.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: echo-version-blue
  labels:
    app: echo-version
    color: blue
spec:
  replicas: 1
  selector:
    matchLabels:
      app: echo-version
      color: blue
  template:
    metadata:
      labels:
        app: echo-version 
        color: blue
    spec:
      containers:
      - name: echo-version 
        image: gihyodocker/echo-version:0.1.0 
        ports:
        - containerPort: 8080
강사 김대경 님이 모두에게:    오전 9:37
cat > deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: etcd-operator-deployment
  labels:
    app: etcd-operator
spec:
  replicas: 3
  selector:
    matchLabels:
      app: etcd-operator
  template:
    metadata:
      labels:
        app: etcd-operator
    spec:
      containers:
      - name: etcd-operator
        image: quay.io/coreos/etcd-operator:v0.9.4
        command:
        - etcd-operator
        # Uncomment to act for resources in all namespaces. More information in doc/user/clusterwide.md
        #- -cluster-wide
        env:
        - name: MY_POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: MY_POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:39
swedu에 올려주시면 감사하겠습니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:45
강사님 죄송한데 deployment.yaml먼저 올려주시면 감사하겠습니다. 구두로 수정포인트 설명해주신것과 다릅니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:45
metadata부분도 수정하셨는데, 복사해서는 intent가 맞지 않아서 create가 되지 않습니다
CTO부문_백지웅 님이 모두에게:    오전 9:50
$ kubectl create -f example-etcd-cluster.yaml 
error: unable to recognize "example-etcd-cluster.yaml": no matches for kind "EtcdCluster" in version "etcd.database.coreos.com/v1beta2"

CTO부문_백지웅 님이 모두에게:    오전 9:51
에러 나네요..
강사 김대경 님이 모두에게:    오전 9:56
사용하시는 쿠버네티스 버전과 매칭되는지 검토해 봐야 합니다.
CTO_김성찬 님이 모두에게:    오전 9:56
저는 앞으로의 수업 진행이 가능할지 의문이네요
CTO_김성찬 님이 모두에게:    오전 9:58
네 여전합니다 virtubal box 재 설치만 4번 정도..
구세완 님이 모두에게:    오전 9:59
etcd cluster 는 워커노드에만 생성되나요?
CTO_김성찬 님이 모두에게:    오전 10:00
어떤 식으로든 가능하신 방법으로 지원 부탁 드리겠습니다
김민재 책임 님이 모두에게:    오전 10:09
k3s@master:~/tool/etcd-operator/example$ kubectl get pods
NAME                                        READY   STATUS     RESTARTS   AGE
etcd-operator-deployment-64689467f6-5bzxt   1/1     Running    0          20m
etcd-operator-deployment-64689467f6-wgfs5   1/1     Running    0          20m
etcd-operator-deployment-64689467f6-gxcld   1/1     Running    0          20m
example-etcd-cluster-2hknr2r2m6             1/1     Running    0          18m
example-etcd-cluster-8lqsv87wb6             1/1     Running    0          17m
example-etcd-cluster-g9s8pk759d             1/1     Running    0          17m
example-etcd-cluster-hrnc72n84b             0/1     Init:0/1   0          10s
k3s@master:~/tool/etcd-operator/example$ 
저는 4개가 생성되는것 같은데 
김민재 책임 님이 모두에게:    오전 10:09
네 이제 5개 생성 되었습니다.
BS_장준표 님이 모두에게:    오전 10:09
현재 가지 작업된것이 master node의 api server가 배포된 etcd를 바라 보고 있는 상태 인가요?
CTO 윤태희 님이 모두에게:    오전 10:10
데이터는 어디에 저장되나요?
구세완 님이 모두에게:    오전 10:11
아래 command 로는 제환경에서 해당 클러스터pod가 worker노드에 생성되네요.  kubectl get pods -o wide | grep etcd-cluster
CTO_김병훈 님이 모두에게:    오전 10:13
external etcd 쓸때 master에서는 아무것도 수정안해도 되나요?
BS_장준표 님이 모두에게:    오전 10:14
마스터 노드가 여러개 있을 경우 각각의 마스터에 있는 etcd들은 클러스터링 설정 할 수 있나요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:25
Failed to pull image "dockerhub.qingcloud.com/google_containers/leader-elector:0.5": rpc error: code = Unknown desc = Error response from daemon: Head https://dockerhub.qingcloud.com/v2/google_containers/leader-elector/manifests/0.5: unauthorized: authentication required
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:25
권한이 없어서 이미지를 못가져오는거 같습니다.
신동렬 님이 모두에게:    오전 10:29
이미지 풀 에러는 왜 발생하는 것인가요? 
CTO 윤태희 님이 모두에게:    오전 10:31
파드에서의 리더의 역할은 뭔가요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:31
leader 로 선출된 pod는 본인이 leader라는 신호(?)를 받을 수 있나요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:31
선출될 경우
김민재 책임 님이 모두에게:    오전 10:32
에러가 나는  leader를 종료 하고 정상적으로 동작하는것 처럼 보이는데(?) ErrImagePull 에러 없음
김민재 책임 님이 모두에게:    오전 10:33
kubectl logs deployment.apps/leader-elector leader-elector
Found 4 pods, using pod/leader-elector-59b95c7c76-66zzc
error: container leader-elector is not valid for pod leader-elector-59b95c7c76-66zzc
근데 여전히  leader는 vaild하지 않는건 왜 그런걸까요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:34
leader-elector라는 pod은 단순히 리더 선출만 하는거고 다른 동작은 아무것도 안하는건가요? 기능 구현을 위해서는 leader-elector를 base로 개발을 해야하는것인지요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:36
그냥 개념설명용 example정도로 생각하면 되는건가요
BS_장준표 님이 모두에게:    오전 10:37
여러개의 pod가 생성되는 서비스의 경우 leader 선정하는 것이 고가용성 측면에서 좋다고 생각 하면 되나요?
vs하창완 님이 모두에게:    오전 10:38
정책이라는게 쿠버네티스의 설정인가요?? 아니면 yaml에서 설정하는지? container레벨에서 하는건가요??
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:38
네 답변 감사합니다. 필요에 따라 참고용으로 보면 된다로 이해하였습니다
vs하창완 님이 모두에게:    오전 10:41
감사합니다.
강사 김대경 님이 모두에게:    오전 10:47
apiVersion: apps/v1
kind: Deployment
metadata:
 name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 3
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
신동렬 님이 모두에게:    오전 10:52
 strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
신동렬 님이 모두에게:    오전 10:52
요 부분만 잡히고 
신동렬 님이 모두에게:    오전 10:53
f:strategy: 부분은 안잡히네요;; 
공서우/선임연구원/DXT센터 님이 모두에게:    오전 10:57
아까 leader-elector 이미지는 gcr.io/google_containers/leader-elector:0.4 사용해보세요
강사 김대경 님이 모두에게:    오전 11:12
kubectl patch deployment echo-version -p '{"spec":{"template":{"spec":{"containers":[{"name":"echo-version","image":"gihyodocker/echo-version:0.2.0"}]}}}}'
CTO 윤태희 님이 모두에게:    오전 11:14
rolling update시에 기존 버전의 pod에서 long running 중인 사용자 request를 처리중이었다면 처리중이던 사용자 request는 어떻게 되나요? 
LG유플러스 김태경 님이 모두에게:    오전 11:16
업데이트가 POD를 재기동하는 형태니까 두버전으로 처리되는게 아니라, 일시적으로 단절을 경험하는거 아닌가요?
CTO_김성찬 님이 모두에게:    오전 11:22
교재 128 page 질문입니다. "배포 리소스는 하나의 노드를 업그레이드하는 경우 유용" --> 노드를 업그레이드 한다는 것을 좀 더 설명 가능하실까요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:29
롤링업데이트에서 발생할수 있는 문제점을 보강하는 방법론으로 봐야하는것 아닌지요? 완전 다른 업데이트 방식이라기보다는
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:30
blue-green에서는 테스트 통과시 모든 pod이 동시에 1.1로 넘어가게 되는개념인가요?
강사 김대경 님이 모두에게:    오전 11:39
kubectl patch service echo-version -p '{"spec":{"selector":{"color":"green"}}}'
CTO_김성찬 님이 모두에게:    오전 11:40
echo-version-bluegreen-service.yaml 내용 공유 가능하신가요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:40
댓글로 있습니다
CTO_김성찬 님이 모두에게:    오전 11:50
CP 약자, AP 약자가 무슨 뜻인지 궁금합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:51
식사맛잇게 하세요
신동렬 님이 모두에게:    오전 11:52
수고하셧스빈다
강사 김대경 님이 모두에게:    오전 11:52
네 감사합니다. 점심 맛이?ㅆ
강사 김대경 님이 모두에게:    오전 11:52
점심 맛있게 드세요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:01
네
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:46
토큰확인 명령어 한번만 더 보여주세요
구세완 님이 모두에게:    오후 1:50
마지막 명령어 한번만 더 보여주세요.
강사 김대경 님이 모두에게:    오후 1:51
 kubectl -v=7 get po pod-1
구세완 님이 모두에게:    오후 1:52
명령의 목적을 한번 더 설명해주실 수 있을지요..?
강사 김대경 님이 모두에게:    오후 1:53
클라이언트에서 API 서버 접근 하는 유형에 대해 살펴보는 조회 명령어입니다.
김민재 책임 님이 모두에게:    오후 2:35
명령어 채팅창에 남겨주실수 있나요?
김민재 책임 님이 모두에게:    오후 2:36
그리고 username과 password는 노출되지 않고 입력 받는형태로 생성 할수는 없나요?
강사 김대경 님이 모두에게:    오후 2:37
kubectl create secret docker-registry regcred --docker-server=lookerz-private --docker-username=계정아이디 --docker-password=비밀번호 --docker-email=이메일
kubectl get secret regcred --output=yaml
kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode
echo "앞에서 조회한 토큰 값" | base64 --decode
강사 김대경 님이 모두에게:    오후 2:44
apiVersion: v1
kind: Pod
metadata:
  name: private-reg
spec:
  containers:
  - name: private-reg-container
    image: lookerz/lookerz-private
  imagePullSecrets:
  - name: regcred

강사 김대경 님이 모두에게:    오후 3:03
kubectl get nodes -o=jsonpath=$'{range .items[*]}{@.metadata.name}: {@.status.nodeInfo.kubeletVersion}\n{end}'
강사 김대경 님이 모두에게:    오후 3:05
cat /sys/module/apparmor/parameters/enabled

강사 김대경 님이 모두에게:    오후 3:05
sudo cat /sys/kernel/security/apparmor/profiles
강사 김대경 님이 모두에게:    오후 3:06
ssh master "sudo cat /sys/kernel/security/apparmor/profiles | sort"
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:09
지금 루트 계정이라서
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:09
그러신것 같은데요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:09
k3s 계정으로 하는게 아닐까요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:09
저는 다른 오류가 나옵니다
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:10
sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:10
지금 그 오류랑 같은 메시지입니다
강사 김대경 님이 모두에게:    오후 3:12
kubectl get nodes -o=jsonpath=$'{range .items[*]}{@.metadata.name}: {.status.conditions[?(@.reason=="KubeletReady")].message}\n{end}'
강사 김대경 님이 모두에게:    오후 3:16
apiVersion: v1
kind: Pod
metadata:
  name: hello-apparmor
  annotations:
    container.apparmor.security.beta.kubernetes.io/hello: localhost/k8s-apparmor-example-deny-write
spec:
  containers:
  - name: hello
    image: busybox
    command: [ "sh", "-c", "echo 'Hello AppArmor!' && sleep 1h" ]

구세완 님이 모두에게:    오후 3:24
157페이지(104페이지) 의 프로파일은 어떻게 실행을 했는지요?
구세완 님이 모두에게:    오후 3:27
그 코드들은 어디서 볼 수 있나요?
강사 김대경 님이 모두에게:    오후 3:28
/sys/kernel/security/apparmor/profiles
강사 김대경 님이 모두에게:    오후 3:34
kubectl run hello-web --labels app=hello --image=gcr.io/google-samples/hello-app:1.0 --port 8080 --expose
강사 김대경 님이 모두에게:    오후 3:35
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: hello-allow-from-foo
spec:
  policyTypes:
  - Ingress
  podSelector:
    matchLabels:
      app: hello
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: foo

강사 김대경 님이 모두에게:    오후 3:41
kubectl run -l app=foo --image=alpine --restart=Never --rm -it test-1
강사 김대경 님이 모두에게:    오후 3:42
wget -qO- --timeout=2 http://hello-web:8080
강사 김대경 님이 모두에게:    오후 3:46
네 그럴 수 있습니다. 클라우드 서비스에서 제한이 될 수 있습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 4:05
저 과제에서 클러스터의 갯수는 몇개인가요?
공서우/선임연구원/DXT센터 님이 모두에게:    오후 4:06
구축 과정 스크립트 모두인가요;;
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 4:08
???
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 4:08
마스터 생성할때 클러스터 생성이 자동으로 되는데 
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 4:09
마스터가 설정된 클러스터에 마스터 참여시키는 명령을 우리가 배웠나요?
CTO_김병훈 님이 모두에게:    오후 4:10
\[
민경직/선임/webOS Platform Task 님이 모두에게:    오후 4:50
실제로 그래서 어떻게 join시키는지는 내일 강의해주시나요?
