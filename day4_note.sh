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
구세완 님이 모두에게:    오전 10:38
교재는 컨테이너1, 컨테이너2 로 되어있는데요. 교재를 수정해야 하는지요? 
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
신동렬/LG유플러스 님이 모두에게:    오전 11:29
cbr과 cni는 어떻게 다른건가요? 
CTO_김성찬 님이 모두에게:    오전 11:31
cbr 이라면 custom bridge 를 의미하나요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 11:32
calico 썼습니다.
신동렬/LG유플러스 님이 모두에게:    오전 11:32
calico, weavenet 써봣습니다 
구세완 님이 모두에게:    오전 11:33
weave, multus, Flannel 인스톨해봤는데요. 
구세완 님이 모두에게:    오전 11:34
멀티캐스팅이 내부적으로 되는 것을 찾았는데, multus가 된다고 들어서..
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 11:35
몇개의 노드에 몇천개의 pod 구성해서 실시간 부하를 거는 용으로 사용해도 특별하게 문제가 없어서 다른걸 안써봤습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 11:50
on-premise에서 진행했습니다.
강사 김대경 님이 모두에게:    오전 11:50
고생하셨습니다. 점심 식사 맛있게 하세요
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:08
마스터에서는 보이나요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:09
옵션때문인건지 실제 pod이 배포된곳에서만 보이는건지
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:09
구분이 안가서..
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:10
버전은 kubernetes 버전을 말씀하신건가요? 
민경직/선임/webOS Platform Task 님이 모두에게:    오후 1:10
저는 지금 master에 배포되었고 master에서만 보이는 상태거든요
BS_장준표 님이 모두에게:    오후 1:18
강사님 network pocliy yaml 파일에서 ingress 부분 좀 설명 부탁 드립니다.
강사 김대경 님이 모두에게:    오후 1:23
kubectl apply -f https://docs.projectcalico.org/manifests/canal.yaml
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:29
podSelector 가 없으면 아무곳(어떤 pod)에도 적용하지 않는다는 의미가 아닌가요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:46
network policy 가 적용(실행)되는 위치가 어디인가요? kube-proxy? kubelet?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:51
방금 pod 안에서 호출한 방식도 master(kubelet)을 경유한 건가요? 보이는건 바로 pod ip 로 호출한것처럼 보여서요?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:51
네
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:53
네
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:53
실습은 client -> web, client->non-web ip로 바로 요청한것으로 보여서요
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:54
저렇게 되면 network policy가 개입할 위치가 없지 않나해서요
구세완 님이 모두에게:    오후 1:54
수업하는 networkpolicy  클러스터 내부에 대한 것인지, 혹은 외부에서 들어오는 것도 제어가 가능한지요?
강사 김대경 님이 모두에게:    오후 1:55
client -> web 에서 -> 부분에서 제어 역할이 있게 됩니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:55
저도 cluster 외부에서 들어오는 ingress에 관련된 내용으로 보여서요.
구세완 님이 모두에게:    오후 1:55
예
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:55
내부 pod to pod는 아닌것 같은 느낌이...
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 1:59
네 말씀감사합니다.
윤태희/책임/빅데이터엔지니어링TP 님이 모두에게:    오후 2:10
Networkpolicy가 적용되는 범위는 cluster 레벨인가요 namespace 레벨인가요?
윤태희/책임/빅데이터엔지니어링TP 님이 모두에게:    오후 2:14
Networkpolicy 정의 YAML에 namespace 를 정의하는 부분이 있어서 여쭤봅니다
신동렬/LG유플러스 님이 모두에게:    오후 2:15
namespace 기준으로 알고 있고, network policy에서 namespace영역을 지정하지 않으면, default namespace로 자동 정의되는 것으로 이해하고 있습니다. 
윤태희/책임/빅데이터엔지니어링TP 님이 모두에게:    오후 2:15
네 감사합니다
신동렬/LG유플러스 님이 모두에게:    오후 2:15
kubectl get all 을 했을때도 namespace를 지정하지 않고 호출하면 default의 namespace에 상세만 출력됩니다. 
김민재 책임/webOS platform TasK 님이 모두에게:    오후 2:18
pod에 특정 라벨이 추가되어있는지 확인 할수있는 방법은 없나요?
신동렬/LG유플러스 님이 모두에게:    오후 2:25
kubectl get pod [pod명] -n [namespace] --show-labels 로 확인해보시면 되지 않을까 합니다. 
김민재 책임/webOS platform TasK 님이 모두에게:    오후 2:26
감사합니다.
CTO_김성찬 님이 모두에게:    오후 2:34
이 예제는 아까 설치한 canal 과는 상관 없이 동작하는건가요
강사 김대경 님이 모두에게:    오후 2:47
kubectl expose deployment hello-world --type=NodePort --name=example-service
강사 김대경 님이 모두에게:    오후 2:49
kubectl get pods --selector="run=load-balancer-example" --output=wide
구세완 님이 모두에게:    오후 2:51
hello-world 는 그전 api-gateway 와는 무관한건가요? 
구세완 님이 모두에게:    오후 2:51
어떤 연결고리가 있는지 안보여서요.
신동렬/LG유플러스 님이 모두에게:    오후 2:54
아까 yaml 보면 그냥 서비스 로드밸런서를 명칭을 그냥 api-gateway라고 명명하신것만 같아보였스빈다 
BS_장준표 님이 모두에게:    오후 2:57
api-gateway.yaml 파일은 서비스 오브젝트 생성 코드 같은데 포드 까지 같이 배포되는건 무엇 때문인가요?
강사 김대경 님이 모두에게:    오후 2:58
hello-application 말씀하시는 거죠?
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:02
강사님 말씀하시는거 아니시죠? 마이크가 꺼져있는데요.
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:02
혹시 저만 오디오
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:02
안나오는거 아니죠?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:02
강사님이 mute 깜빡하신것 같습니다
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:02
처음부터 다시 하셔야겠네요.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오후 3:23
metrics 서비스도 설치하나요?
구세완 님이 모두에게:    오후 3:28
지금까지 설치한 yaml 전체가 몇개인가요?
CTO부문_백지웅 님이 모두에게:    오후 3:37
그라파나 id pw 어떤걸로 넣어야 하나요
강사 김대경 님이 모두에게:    오후 3:38
admin/admin
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:48
여기에는 왜 외부주소가 아니라 내부주소를 입력해줘야 하는건가요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:49
pod 내부 통신이라는거죠?
CTO부문_백지웅 님이 모두에게:    오후 3:52
import 부분 어떤걸 import 해야하나요
민경직/선임/webOS Platform Task 님이 모두에게:    오후 3:52
여기서 보이는 resource들은 특정 node 인거죠? pod기준이 아니라
김민재 책임/webOS platform TasK 님이 모두에게:    오후 3:53
프로메테우스의 내부 아이피를 연결하는 부분 다시 설명 부탁 드립니다. 
신동렬/LG유플러스 님이 모두에게:    오후 3:58
방금 프로메테우스를 nodeport로 지정하고 clusterip를 
김민재 책임/webOS platform TasK 님이 모두에게:    오후 3:58
네 감사합니다.
신동렬/LG유플러스 님이 모두에게:    오후 3:58
지정하였는데 
신동렬/LG유플러스 님이 모두에게:    오후 3:58
nodeport를 지정안하고 그냥 배포한 상태에서 clusterip로 등록하고자 한다면 가능한다가요? nodeport를 지정안하면 안되겟죠? 
신동렬/LG유플러스 님이 모두에게:    오후 3:59
넵 이해했습니다
