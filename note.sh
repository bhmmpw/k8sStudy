#!/bin/bash

exit 0

k3s@master:~/k/day3$ k get deploy --all-namespaces
NAMESPACE              NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
default                leader-elector              0/3     3            0           22h
kubernetes-dashboard   dashboard-metrics-scraper   1/1     1            1           43h
kube-system            local-path-provisioner      1/1     1            1           15d
monitoring             prometheus-deployment       1/1     1            1           40h
default                etcd-operator-deployment    3/3     3            3           23h
kube-system            metrics-server              1/1     1            1           41h
kube-system            coredns                     1/1     1            1           15d
default                nginx-deployment            3/3     3            3           22h
kubernetes-dashboard   kubernetes-dashboard        1/1     1            1           43h
default                hue-learn                   3/3     3            3           2m43s
k3s@master:~/k/day3$ k delete default -n heu-learn
error: the server doesn't have a resource type "default"
k3s@master:~/k/day3$ k delete hue-learn -n default
error: the server doesn't have a resource type "hue-learn"
k3s@master:~/k/day3$ k delete deploy hue-learn -n default
deployment.apps "hue-learn" deleted
k3s@master:~/k/day3$ k delete deploy kubernetes-dashboard -n kubernetes-dashboard
deployment.apps "kubernetes-dashboard" deleted
k3s@master:~/k/day3$ k delete deploy nginx-deployment -n default
deployment.apps "nginx-deployment" deleted
k3s@master:~/k/day3$ k delete deploy etcd-operator-deployment -n default
deployment.apps "etcd-operator-deployment" deleted
k3s@master:~/k/day3$ k delete deploy prometheus-deployment -n monitoring
deployment.apps "prometheus-deployment" deleted
k3s@master:~/k/day3$ k delete deploy dashboard-metrics-scraper -n kubernetes-dashboard
deployment.apps "dashboard-metrics-scraper" deleted
k3s@master:~/k/day3$ k delete deploy leader-elector -n default
deployment.apps "leader-elector" deleted

CTO_김성찬 님이 모두에게:    오전 7:56
출석을 위한 QR 코드가 제공되었나요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 7:56
안녕하세요. 출석 아직 안나온듯 싶습니다.
webex 498 님이 모두에게:    오전 7:57
늦어서 죄송합니다!
webex 498 님이 모두에게:    오전 7:57
강사님~ 5분까지 qr코드 띄우겠습니다. 죄송합니다!
강사 김대경 님이 모두에게:    오전 7:57
네.. 안녕하세요? 좋은 아침입니다.
webex 498 님이 모두에게:    오전 8:03
다찍으신거같아 수업시작하셔도 되겠습니다~!
강사 김대경 님이 모두에게:    오전 8:03
네... 감사합니다.
webex 498 님이 모두에게:    오전 8:03
감사합니다 :)
강사 김대경 님이 모두에게:    오전 8:28
네...
강사 김대경 님이 모두에게:    오전 8:30
FROM busybox
CMD ash -c "echo 'Started...'; while true ; do sleep 10 ; done“

김민재 책임 님이 모두에게:    오전 8:35
0.3과 0.4의 차이가 어떤건가요? 
강사 김대경 님이 모두에게:    오전 8:44
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hue-learn
  labels:
    app: hue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hue
  template:
    metadata:
      labels:
        app: hue
    spec:
      containers:
      - name: hue-learner
        image: lookerz/hue-learn:0.3
구세완 님이 모두에게:    오전 8:44
정렬할 시간 1분만 주세요.
강사 김대경 님이 모두에게:    오전 8:48
kubectl get pods -o jsonpath='{.items[*].spec.containers[0].image}'
강사 김대경 님이 모두에게:    오전 8:59
apiVersion: apps/v1
kind: Deployment
metadata: 
  name: hue-reminders
spec: 
  replicas: 2 
  selector: 
    matchLabels: 
      app: hue 
      service: reminders 
  template: 
    metadata: 
      name: hue-reminders 
      labels: 
        app: hue 
        service: reminders 
    spec: 
      containers: 
      - name: hue-reminders 
        image: lookerz/hue-reminders:3.0 
        ports: 
        - containerPort: 8080
김민재 책임 님이 모두에게:    오전 9:02
저는 k3s@master:~/hue$ kubectl get pods -l app=huekubectl get pods | grep hue-learn
error: name cannot be provided when a selector is specified

김민재 책임 님이 모두에게:    오전 9:03
이렇게 에러가 발생하는데 
강사 김대경 님이 모두에게:    오전 9:05
띄어 쓰기 해야 할 듯 합니다.
강사 김대경 님이 모두에게:    오전 9:06
app=hue kubectl로요
강사 김대경 님이 모두에게:    오전 9:07
하나씩 해 보면 어떨까요?
CTO_김성찬 님이 모두에게:    오전 9:09
두 개의 deployment 에서 컨테이너는 다 같은 건가요
강사 김대경 님이 모두에게:    오전 9:14
apiVersion: v1
kind: Service
metadata: 
  name: hue-reminders 
  labels: 
    app: hue 
    service: reminders
spec: 
  ports: 
  - port: 8080 
    protocol: TCP 
  selector: 
    app: hue 
    service: reminders

박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:21
lookup 이 안된 오류메시지로 보이는데요.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:22
네
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:22
제대로 lookup 이 안되었는데요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:22
dns 정보만 위에 나오는거구요
구세완 님이 모두에게:    오전 9:24
service 의 selector 가,  hue-learn 과 hue-reminder 를 모두 지정한건가요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:25
지금 하신 lookup 모두 다 실패로 나오는거 같습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 9:25
제대로 ip 조회된 리턴은 없었습니다.
구세완 님이 모두에게:    오전 9:31
띄어쓰기요
CTO_김성찬 님이 모두에게:    오전 9:31
--nslookup 
CTO_김성찬 님이 모두에게:    오전 9:31
아까 구세완님 질문 내용 저도 궁금합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:31
--  뒤에 띄어쓰기요.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:31
그래도 여전히 can't find 나오는데요
구세완 님이 모두에게:    오전 9:33
service yaml 에서 selector 설명을 부탁드립니다. 실무에서는 가장 에러가 많이 나는 부분인데요.
구세완 님이 모두에게:    오전 9:34
그게 and 조건인가요 or조건인가요?
구세완 님이 모두에게:    오전 9:35
hue-learn-deployment 에도 app: hue 가 있으니까 매칭이 되는 거 아닌가요?
CTO_김성찬 님이 모두에게:    오전 9:38
yaml 코드에서 hue-reminders가 .. 내부 서비스임을 어디에서 알 수 있을까요?
구세완 님이 모두에게:    오전 9:40
service 는 예약어가 아니라 아무 이름이나 붙여도 되는 거 아닌가요?
구세완 님이 모두에게:    오전 9:44
제 뜻은 service: reminder 에서 service 는 아무이름을 붙이고 일관되게 사용해도 되는지에 대한 질문입니다.
구세완 님이 모두에게:    오전 9:44
kind에 있는 service가 아니구요
구세완 님이 모두에게:    오전 9:45
key: value 잖아요
구세완 님이 모두에게:    오전 9:45
예
구세완 님이 모두에게:    오전 9:46
그리고, hue-reminder-service.yaml 에서 selector 에 2개 app: hue, service: reminders 가 있는데, 2개 모두 매칭이 되는 deployment 랑 연결이 되는지건지 하나만 맞아도 되는 건지요? 
구세완 님이 모두에게:    오전 9:47
그럼, hue-learn 과도 매칭이 되는데요
구세완 님이 모두에게:    오전 9:48
hue-learn yaml 파일 보시면 app: hue 가 있잖아요.
구세완 님이 모두에게:    오전 9:49
하나는 매칭이 되니 연결되는게 아닌지에 대한 질문입니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:49
결론은 앤드조건이라고 설명해주시는것 같네요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:51
지금 질문하신 분의 의도는 selector 내부에 조건들이 And조건이냐 Or조건이냐가 제일 궁금하신건데 답변이 계속 겉도는것 같습니다
강사 김대경 님이 모두에게:    오전 9:58
 selector 에 2개 app: hue, service: reminders  모두 매칭이 되어야 합니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:06
reminder 이미지를 busybox 로만 만들었는데 기본 busybox 이미지가 8080에 대해 원래 응답이 있나요?
CTO부문_윤동영 님이 모두에게:    오전 10:06
우리가 띄운 learn 이나 reminder 도커 이미지가 8080으로 접속되는 서비스 데몬이 돌고 있는 도커 이미지가 아니지 않나요? 단순 에코만 출력하는 이미지 아니었나요? dentist 라는 ... string이 어느 시점에 들어간건지?
강사 김대경 님이 모두에게:    오전 10:21
apiVersion: v1
kind: Pod
metadata:
  name: trouble-shooter 
  labels: 
    role: trouble-shooter
spec: 
  nodeSelector: 
    kubernetes.io/hostname: k3d-k3s-default-worker-2 
  containers: 
  - name: trouble-shooter 
    image: g1g1/py-kube:0.2 
    command: ["bash"] 
    args: ["-c", "echo started...; while true ; do sleep 1 ; done"]

CTO_김성찬 님이 모두에게:    오전 10:23
image 가 접근 가능한 거 맞지요
CTO_김성찬 님이 모두에게:    오전 10:24
되네요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:26
계속 pending으로 뜨는데 k3d-k3s-default-worker-2 라는 워커노드이름이 달라서 그런걸까요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:26
실습대로만 따라했는데 저 이름은 어디서 얻어올 수 있나요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:27
아 대쉬가 붙어있군요 처음에 공유해주신거에
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:27
worker-2 -> worker2
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:28
음.. 수정해도 계속 pending이네요
김민재 책임 님이 모두에게:    오전 10:29
그냥 worker1 이나 worker2로 해야 하지 않나요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:30
3
구세완 님이 모두에게:    오전 10:30
3
신동렬/LG유플러스 님이 모두에게:    오전 10:30
3
구세완 님이 모두에게:    오전 10:30
kubectl describe node | grep kubernetes.io/hostname 로 확인을 하시면 될 듯 합니닫.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:30
hostname 에 등록한 node 이름을 넣어서 했습니다.
신동렬/LG유플러스 님이 모두에게:    오전 10:31
동일하게 했습니다 
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:31
vm의 hostname은 안되구요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:31
그냥 단순히 worker2로 나오네요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:32
yaml파일 수정해주셔야 하는거 아닌가요 실습 책에
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:32
비기너는 쉽지가 않네요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:32
박상욱 책임님 답변 감사합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:32
잘되네요 이제
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:33
k3d-k3s-default-worker-2
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:33
를 worker2로 바꾸고
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:33
다시 create했어요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:33
근데 실습자료대로만 하는데
CTO_김성찬 님이 모두에게:    오전 10:33
저도 채팅창을 따라..
민경직/선임/webOS Platform Task 님이 모두에게:    오전 10:33
안되는건 실습자료에 오류가 있는거니 수정해주세요
강사 김대경 님이 모두에게:    오전 10:43
apiVersion: v1
kind: Pod
metadata:
  name: no-tolerate
spec:
  containers:
  - name: nginx
    image: nginx

강사 김대경 님이 모두에게:    오전 10:46
apiVersion: v1
kind: Pod
metadata:
  name: tolerate
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "project"
    value: "A"
    operator: "Equal"
    effect: "NoSchedule"

CTO부문_백지웅 님이 모두에게:    오전 10:52
강사님 vm이랑 터미널창좀 키워주세요
김민재 책임 님이 모두에게:    오전 10:52
k3s@master:~/hue/trouble$ kubectl get pod -owide | grep tolerate
no-tolerate                                 1/1     Running            0          7m13s   10.42.0.61   master    <none>           <none>
tolerate                                    1/1     Running            0          3m46s   10.42.0.62   master    <none>           <none>
그리고 저는 둘다 여전히 master이네요 
CTO부문_백지웅 님이 모두에게:    오전 10:53
worker vm 띄우셨나요
강사 김대경 님이 모두에게:    오전 10:54
네.. 조절했습니다.
CTO부문_백지웅 님이 모두에게:    오전 10:54
감사합니다
김민재 책임 님이 모두에게:    오전 10:54
네 실행 시켜두었습니다.
CTO_김성찬 님이 모두에게:    오전 11:05
key 가 있고 value 가 없는 것이지요?
신동렬/LG유플러스 님이 모두에게:    오전 11:05
value: A는 그럼 왜 드렁가 있는것인가요? 
신동렬/LG유플러스 님이 모두에게:    오전 11:05
들어
강사 김대경 님이 모두에게:    오전 11:06
apiVersion: v1
kind: Pod
metadata:
  name: badsector
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "project"
    value: "A"
    operator: "Equal"
    effect: "NoSchedule"
  - key: "badsector"
    operator: "Exists"

신동렬/LG유플러스 님이 모두에게:    오전 11:14
taint와 toleration은 실제 상용 서비스 구성 기준에서는 어떠한 케이스에서 적용을 검토해볼 수 있을까요? 
신동렬/LG유플러스 님이 모두에게:    오전 11:15
일반적으로는 적용을 하지 않을 것 같아서 질문드립니다. 어떠한 직접적인 케이스에서 사용하고 일반적으로는 사용하지 않는게 맞는지 궁금합니다. 
강사 김대경 님이 모두에게:    오전 11:15
apiVersion: v1
kind: Pod
metadata:
  name: node-affinity
spec:
  containers:
  - name: nginx
    image: nginx
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: disktype
            operator: In
            values:
            - ssd

강사 김대경 님이 모두에게:    오전 11:31
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pod-affinity
spec:
  selector:
    matchLabels:
      app: affinity
  replicas: 2
  template:
    metadata:
      labels:
        app: affinity
    spec:
      containers:
      - name: nginx
        image: nginx
      affinity:
        podAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - affinity
            topologyKey: "kubernetes.io/hostname"
구세완 님이 모두에게:    오전 11:39
node affinity 는 아래 명령어로 라벨링해서 동작되었습니다. 
구세완 님이 모두에게:    오전 11:39
kubectl label node worker1 disktype=ssd
강사 김대경 님이 모두에게:    오전 11:42
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pod-antiaffinity
spec:
  selector:
    matchLabels:
      app: antiaffinity
  replicas: 2
  template:
    metadata:
      labels:
        app: antiaffinity
    spec:
      containers:
      - name: nginx
        image: nginx
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - antiaffinity
            topologyKey: "kubernetes.io/hostname"

강사 김대경 님이 모두에게:    오전 11:48
수고 많으셨습니다. 점심 식사 맛있게 하세요.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:49
식사 맛있게 하세요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:49
강사님 죄송한데
공서우/선임연구원/DXT센터 님이 모두에게:    오전 11:49
점심맛있게드세요
강사 김대경 님이 모두에게:    오전 11:49
네..
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:49
yaml파일들 swedu에 한번씩 올려주시면 감사하겠습니다 ㅠ
강사 김대경 님이 모두에게:    오전 11:49
넵... 점심 식사 시간에 작업해 드리겠습니다. 식사 맛있게 하세요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:49
감사합니다

CTO_김성찬 님이 모두에게:    오후 1:24
저는 apiVersion: batch/v1 이라는 건 처음 보는 것 같은데, 이 부분 좀 더 설명 가능하실까요?
CTO_김성찬 님이 모두에게:    오후 1:46
197 page 에서 질문인데요 readiness probe 가 실패일때
CTO_김성찬 님이 모두에게:    오후 1:47
컨테이너의 모드는 등록된 모든 서비스의 엔드 포인트에서 삭제됨 이부분 설명 좀..
CTO_김성찬 님이 모두에게:    오후 1:49
그러면 청취에 대한 liveness probe 는 OK 이어도
CTO_김성찬 님이 모두에게:    오후 1:49
readiness가 failure 이면
신동렬/LG유플러스 님이 모두에게:    오후 2:14
Master노드도 자동 scaleout이 되게 할 수 있나요? 
신동렬/LG유플러스 님이 모두에게:    오후 2:15
넵 감사합니다. 
강사 김대경 님이 모두에게:    오후 2:26
https://github.com/kubernetes-sigs/metrics-server

구세완 님이 모두에게:    오후 2:30
적용을 안하신 것 같습니다.
신동렬/LG유플러스 님이 모두에게:    오후 2:31
apply 이후에 yaml파일 수정 부분 다시한번만 보여주시길 부탁드리겟습니다. 
CTO부문_백지웅 님이 모두에게:    오후 2:33
kubectl top pods -n kube-system
이거 먼저 하고 하니까 되네요
CTO부문_백지웅 님이 모두에게:    오후 2:33
k3s@master1:~/metrics$ kube top nodes
명령어 'kube' 을(를) 찾을 수 없습니다. 다음 명령어로 시도하시겠습니까:
  snap kubukubu의 명령어 ' (1.1.4)'
  deb jubejube의 명령어 ' (2.2.2-1)'
  deb qubeavogadro-utils의 명령어 ' (1.93.0-3)'
'snap info <snapname>'에서 추가 버전을 확인하십시오.
k3s@master1:~/metrics$ kubectl top pods -n kube-system
NAME                                      CPU(cores)   MEMORY(bytes)
coredns-7dc8bdd58c-dkdjj                  3m           11Mi
local-path-provisioner-7c458769fb-99stg   1m           6Mi
metrics-server-c5f5f4c85-jhc7r            4m           14Mi
k3s@master1:~/metrics$
k3s@master1:~/metrics$
k3s@master1:~/metrics$
k3s@master1:~/metrics$ kubectl top nodes
NAME        CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
master      91m          4%     1205Mi          60%
worker1-1   41m          2%     1085Mi          54%

강사 김대경 님이 모두에게:    오후 3:03
kubectl config set-context ns --namespace=ns --user=default --cluster=default
CTO_김성찬 님이 모두에게:    오후 3:13
명령어 공유를 부탁 드립니다
강사 김대경 님이 모두에게:    오후 3:15
  204  kubectl create namespace ns
  205  kubectl config set-context ns --namespace=ns --user-default --cluster=default
  206  kubectl config set-context ns --namespace=ns --user=default --cluster=default
  207  kubectl config use-context ns
  208  cat > compute-quota.yaml
  209  kubectl apply -f compute-quota.yaml
  210  cat > object-count-quota.yaml
  211  kubectl apply -f object-count-quota.yaml
  212  kubectl get quota
  213  kubectl describe quota compute-quota
  214  kubectl describe quota object-counts-quota
  215  cat > nginx-deployment.yaml
  216  kubectl create -f nginx-deployment.yaml
  217  kubectl get pods
  218  kubectl describe deployment nginx
  219  kubectl get rs nginx-deployment-5bf87f5f59 -o json

구세완 님이 모두에게:    오후 3:16
kubectl config use-context ns 이후에 kubectl get pod 를 해보니, 에러가 나는데요.
구세완 님이 모두에게:    오후 3:16
에러메시지는 이와 같습니다. : The connection to the server localhost:8080 was refused - did you specify the right host or port?

구세완 님이 모두에게:    오후 3:16
kubectl config view 는 보입니다.
CTO_김성찬 님이 모두에게:    오후 3:21
Flag --replicas has been deprecated, has no effect and will be removed in the future.
CTO_김성찬 님이 모두에게:    오후 3:21
이렇게 나오네요
CTO_김성찬 님이 모두에게:    오후 3:22
kubectl run nginx \
 --image=nginx \
 --replicas=1 \
 --requests=cpu=100m,memory=4Mi \
 --limits=cpu=200m,memory=8Mi \
 --namespace=ns
김민재 책임 님이 모두에게:    오후 3:22
Flag --replicas has been deprecated, has no effect and will be removed in the future.
pod/nginx created
 저도 동일한 에러가 발생합니다.
구세완 님이 모두에게:    오후 3:22
kubectl config use-context default  도 안됩니닫..
구세완 님이 모두에게:    오후 3:23
아뇨.. 그 명령이 안됩니닫.
구세완 님이 모두에게:    오후 3:23
error: no context exists with the name: "default"

김민재 책임 님이 모두에게:    오후 3:24
저는 옵션이 deprecated 되었다고 나오지만 
김민재 책임 님이 모두에게:    오후 3:24
k3s@master:~/metrics$ kubectl get pod
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          98s
k3s@master:~/metrics$ 

김민재 책임 님이 모두에게:    오후 3:24
이렇게 실행 되면 동작 하는걸까요?
구세완 님이 모두에게:    오후 3:37
예
vs하창완 님이 모두에게:    오후 3:37
네
김민재 책임 님이 모두에게:    오후 3:37
네
윤태희/책임/빅데이터엔지니어링TP 님이 모두에게:    오후 3:37
OK
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:43
공유해주신 방법으로 어제 클러스터를 구성했었는데 오늘 해당 클러스터에서 수업을 들어보니 멀티 클러스터로 동작을 하지 않습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:45
그냥 하나의 클러스터에 복수 마스터 복수 워커형태로 동작을 합니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:45
네
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:45
마스터1에 워커1을 조인시켜도 마스터2를 통해 리소스 배포를 하면 마스터2의 워커1이 아닌 마스터1의 워커1에 배포가 되는 경우도 있습니다.
