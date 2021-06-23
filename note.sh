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
