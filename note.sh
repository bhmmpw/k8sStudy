#!/bin/bash

exit 0

박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 8:00
안녕하세요.
강사 김대경 님이 모두에게:    오전 8:01
안녕하세요?
신동렬/LG유플러스 님이 모두에게:    오전 8:46
혹시 명령어나 오늘 교육자료 좀 swedu 에 올려주실 수 있으실까요? 자료가 달라서 따라갈 때 헷갈립니다. ㅜㅜ 
신동렬/LG유플러스 님이 모두에게:    오전 8:49
아... 저걸 못봤네요.  감사합니다.
강사 김대경 님이 모두에게:    오전 8:53
tree 리눅스 명령어인데 설치 안  되어 있을 경우 설치해야 합니다.
강사 김대경 님이 모두에게:    오전 8:53
예로 apt-get install tree
강사 김대경 님이 모두에게:    오전 8:54
이렇게 설치하시면 됩니다. 우분투 환경에서요
CTO_김성찬 님이 모두에게:    오전 9:04
방금 export command 채팅 방에 찍어주실 수 있나요
CTO_김성찬 님이 모두에게:    오전 9:05
저는 pdf 에서 text copy가 안되서요
민경직/선임/webOS Platform Task 님이 모두에게:    오전 9:05
설치하고 나면 NOTES에 뜨는데 고거 복사하셔서 쓰셔도  될것같아요
강사 김대경 님이 모두에게:    오전 9:05
export POD_NAME=$(kubectl get pods --namespace dev -l "app.kubernetes.io/name=hello-world,app.kubernetes.io/instance=hello-world" -o jsonpath="{.items[0].metadata.name}")
강사 김대경 님이 모두에게:    오전 9:06
export CONTAINER_PORT=$(kubectl get pod --namespace dev $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")








구세완 님이 모두에게:    오전 9:34
예
신동렬/LG유플러스 님이 모두에게:    오전 9:40
ready 0 입니다
신동렬/LG유플러스 님이 모두에게:    오전 9:40
맨 밑의 pod
강사 김대경 님이 모두에게:    오전 10:02
https://choosealicense.com/licenses/

강사 김대경 님이 모두에게:    오전 10:03
https://www.olis.or.kr/license/compareGuide.do
구세완 님이 모두에게:    오전 10:15
template 폴더내의 yaml 은 그동안 저희가 배운 kubernetes yaml 을 그대로 써도 되는지요? 아님 helm 문법에 맞도록 다시 작성해야하나요?
구세완 님이 모두에게:    오전 10:19
그럼 그동안 운영하던 쿠버네티스 코드는 재사용이 안되고 다시 작성을 해야하는 건가요?
구세완 님이 모두에게:    오전 10:19
아님 변경을 해주는 과정이 있는지요?
