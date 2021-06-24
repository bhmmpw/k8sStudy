구세완 님이 모두에게:    오전 8:15
파드내부의 컨테이너간 공유인지, 파드사이의 공유가 가능한지요? 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:20
컨테이너 상호간 아닌가요?
구세완 님이 모두에게:    오전 8:21
이 예제에서 emptyDir인 shared-volume 을 다른 pod에 공유가능한가요?
구세완 님이 모두에게:    오전 8:22
요즘 고민되는 부분인데, 테스트를 해주실 수 있을지요?
구세완 님이 모두에게:    오전 8:22
감사합니다..
공서우/선임연구원/DXT센터 님이 모두에게:    오전 8:28
제가 아는 선에서 기본적으로 Pod내 컨테이너간 공유는 기본인데, Pod끼리의 shared volume을 원하시면 아마 PVC를 선언하시고 같이 사용하면되긴 합니다
구세완 님이 모두에게:    오전 8:29
그걸 안하고 하는 방법을 찾는 거라서요
구세완 님이 모두에게:    오전 8:29
방법은 많이 있습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:37
클러스터 안에서 pod 가 어디 node에 배포되었는지 확인안하고 /tmp/mydata를 찾을 수 있을까요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:37
/tmp/data 에요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:38
mydata아니고 data/mydata
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:40
음.. 저도 안되네요 ^^; ㅋㅋ
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:40
전 hostpath-pod 가 master1에 배포가 되서 master1의 /tmp/에서 검색이 됩니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:41
아.. 저도 박상욱 책임님과 동일합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:43
지금 설명해주신게 이해가 잘 안가는게.. host path를 마운트해서 사용하는건데 pod이 배포된 실제 노드가 중요한것 아닌지요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:43
모든 워커노드 /tmp 밑에 보여야 하는건지요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:43
저도 같은 의견입니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:44
hostPath가 모든 노드 mirroring 기능이 있나요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:46
그럼 실제 host는 어디가 되는건지요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:46
모든 노드에서 보인다는게 이해가 가질 않습니다
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:48
말씀하신거처럼 mirroring 유사 기능이 있다면 가능하지만 지금 제 교육 환경이나 기존 현업에서 hostPath를 썼을 때 노드간 mirroring 되는걸 보질 못해서 굉장히 혼란스럽습니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:48
실제로 pod이 배포되지 않은 노드에서도 보인다는게...
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:49
그러면 각각의 노드에서 보이는 /tmp/mydata는 모두 동일한건가요 아니면 노드마다 각각 독립적인건가요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 8:50
share가 된다는 뜻은 박상욱책임님 말씀처럼 mirror가 된다는거네요
CTO_김병훈 님이 모두에게:    오전 8:52
hostpath의 설명이...
CTO_김병훈 님이 모두에게:    오전 8:52
Watch out when using this type of volume, because:
Pods with identical configuration (such as created from a PodTemplate) may behave differently on different nodes due to different files on the nodes
CTO_김병훈 님이 모두에게:    오전 8:53
인데... node 들간 sync가 된다는게... 맞는건가요?
CTO_김병훈 님이 모두에게:    오전 8:53
심지어 이 hostpath를 사용하는 pod가 배포되지 않은 node 까지도....
CTO_김병훈 님이 모두에게:    오전 8:53
저도 이해가 잘 안되네요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:56
제가 알고 있는 것도 hostpath는 node 가 동작하는 physical host의 file system을 node pod에 mount 해주는 기능으로 알고 있어서요.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:57
단순 mount 기능
CTO_김성찬 님이 모두에게:    오전 9:25
공급자가 다르다는 것 같습니다
CTO_김성찬 님이 모두에게:    오전 9:25
공급자가 동일하다는게 아니네요
CTO_김성찬 님이 모두에게:    오전 9:26
240 page
CTO_김성찬 님이 모두에게:    오전 9:28
sp
CTO_김성찬 님이 모두에게:    오전 9:28
네
CTO_김성찬 님이 모두에게:    오전 9:29
Azure는 MS, CInder 는 오픈스택, CephFS는 Ceph 가 공급자라고 보이고 그렇다면 공급자가 다르다는 것 같은데요
구세완 님이 모두에게:    오전 9:33
ReadWriteOnece가 Read 는 무제한이나 쓰는 것은 한번쓰면 그다음은 못쓴다는 건지요?
구세완 님이 모두에게:    오전 9:34
예
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:34
쎄마포어같은건가보네요
BS_장준표 님이 모두에게:    오전 9:37
pv를 생성하면 실제 volume이 생성되는 위치는 어디인지 알수 있나요?( 어느 노드에 생성되는지?)
구세완 님이 모두에게:    오전 10:40
세번째 문장에도 그런데요. 
구세완 님이 모두에게:    오전 10:40
포드1 1234, 포드2 1234 여야 할 듯 합니다.
신동렬/LG유플러스 님이 모두에게:    오전 10:45
저는 이그림에서 궁금했던게 apiserver는 각 노드에 위치한 kube-proxy에게 어떠한 명령을 전달하는건가요? 상세한 동작이 궁금합니다.
신동렬/LG유플러스 님이 모두에게:    오전 10:45
serviceip -> kube-proxy의 동작은 이해하고 있습니다. 
신동렬/LG유플러스 님이 모두에게:    오전 10:45
아 넵 감사합니다. 
