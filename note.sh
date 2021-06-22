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
