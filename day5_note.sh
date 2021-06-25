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






구세완 님이 모두에게:    오전 9:33
chart version, app version 차이가 있는데, 각각 어떤 의미인지요? helm install 시에 둘 다 저장 혹은 구분을 하나요?
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
구세완 님이 모두에게:    오전 10:43
hub.docker.com 을 사용하듯이, bitnami 등을 활용할 수는 공개 레포지토리는 없나요?
BS_장준표 님이 모두에게:    오전 10:43
강사님 upgrade 이후에  history에서 revision을 확인 할수 있는데 특정 revision으로 이동도 가능 한가요?
구세완 님이 모두에게:    오전 10:44
개인이 만든 차크를 푸쉬할 수 있는것을 의미합니다.
구세완 님이 모두에게:    오전 10:46
예...try 해보겠습니다.
BS_장준표 님이 모두에게:    오전 10:47
네 맞습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:48
rollback을 물어보시는거 같습니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 10:48
$ helm rollback --help
This command rolls back a release to a previous revision.
The first argument of the rollback command is the name of a release, and the
second is a revision (version) number. If this argument is omitted, it will
roll back to the previous release.
To see revision numbers, run 'helm history RELEASE'.
Usage:
  helm rollback <RELEASE> [REVISION] [flags]
BS_장준표 님이 모두에게:    오전 10:49
rollback 명령어가 있군요 
BS_장준표 님이 모두에게:    오전 10:49
감사합니다.
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:13
tgz파일 뿐만 아니라 전부 다 add 해야 하는건가요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:14
tgz파일이랑 index.html만 있으면 되는건지, 필수로 필요한게 어떤건지 궁금합니다
신동렬/LG유플러스 님이 모두에게:    오전 11:17
git remote add origin을 안했는데 어떻게 커밋이 됫죠;;; 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:17
origin은 clone할때 자동으로 생성됩니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:17
git remote -v로 확인해보실 수 있어요
신동렬/LG유플러스 님이 모두에게:    오전 11:20
감사합니다. 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:20
origin과 관계없이 commit자체는 로컬에서만 이루어지는거고 서버에 push할 때 remote가 필요합니다.
박상욱책임/생체인지Task/CTO 님이 모두에게:    오전 11:33
3
구세완 님이 모두에게:    오전 11:33
3
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:33
3
CTO_김성찬 님이 모두에게:    오전 11:33
3
BS_장준표 님이 모두에게:    오전 11:33
3
CTO부문_윤동영 님이 모두에게:    오전 11:33
3
윤태희/책임/빅데이터엔지니어링TP 님이 모두에게:    오전 11:33
3
신동렬/LG유플러스 님이 모두에게:    오전 11:33
3
공서우/선임연구원/DXT센터 님이 모두에게:    오전 11:34
3
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:34
저장소는 꼭 github가 아니고 apache로 구성해도 상관없는거죠?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:34
어차피 tgz 바이너리만 있으면 되는것 같은데..
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:34
yaml파일들은 git으로 따로 관리하고
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:34
바이너리는 바이너리 서버로 배포하려고 합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:35
그 helm repo update할때 index.yaml을 참조해서 업데이트 되는건가요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:36
tgz랑 index는 세트네요
공서우/선임연구원/DXT센터 님이 모두에게:    오전 11:37
클러스터를 직접 구성하는 실습외에는 Minikube가 훨씬 편할 듯 싶습니다...
신동렬/LG유플러스 님이 모두에게:    오전 11:37
tgz의 역할이 뭔가요? 필요하다고는 말씀주셨는데 정확히 이해가 어렵습니다. 
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:38
tgz는 패키지 파일인거고 실제로 helm install할때 다운받아서 압축 푼다음 진행될겁니다
신동렬/LG유플러스 님이 모두에게:    오전 11:39
jar war랑 동일하다고 보면될라나요? 
신동렬/LG유플러스 님이 모두에게:    오전 11:39
아 넵 이해했습니다 
BS_장준표 님이 모두에게:    오전 11:39
github에 branch를 새로 생성한 특별한 이유가 있나요?
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:41
형상관리 측면인것같고 기술적인 특별한 이유는 아닌것 같아요
공서우/선임연구원/DXT센터 님이 모두에게:    오전 11:45
수고하셨습니다
민경직/선임/webOS Platform Task 님이 모두에게:    오전 11:46
식사 맛있게 하세요
BS_장준표 님이 모두에게:    오전 11:46
수고하셨습니다.
강사 김대경 님이 모두에게:    오전 11:46
수고하셨습니다. 식사 맛있게 하세요
webex 445 님이 모두에게:    오전 11:51
안녕하세요. 과정 운영자입니다.
[설문안내] 금요일 5시 교육 종료시 시스템 접속이 원활하지 않은 경우가 많아, 미리 안내 드리오니, 쉬는시간을 활용하여 전원 참여를 부탁 드립니다. :) 
☞ 설문링크:   http://survey.lge.com/limesurvey/index.php?r=survey/index&sid=388277&lang=ko 
or http://survey.lge.com/접속 후, Class code : P00000495
메일로도 안내 드렸습니다! 
구세완 님이 모두에게:    오후 1:08
현재 운영중인 deployment.yaml을 helm 으로 바꾸려면 어떻게 접근을 하여 어디를 수정해야할지 잘 모르겠습니다. 
구세완 님이 모두에게:    오후 1:10
간단한 어제했던 echo 라도 보여주시면 도움이 될듯 합니다. 
구세완 님이 모두에게:    오후 1:11
아 제 의미는 제가 갖고 있는 pod 나 deployment  를 어떻게 helm 에 맞도록 수정해야 할지입니다.
강사 김대경 님이 모두에게:    오후 1:11
네 준비되면 말씀드리도록 하겠습니다.
강사 김대경 님이 모두에게:    오후 1:11
아 ! 네..
구세완 님이 모두에게:    오후 1:23
values.yaml 에 하나의 이미지만 설정이 가능한가요?  아니면 --- 등을 통해서 여러 이미지에 대한 것도 넣을 수 있는지요?  혹은 values2.yaml, values3.yaml 을 만들수 있나요?   요약해서 질문드리면  3개 앱이 있으면 3개 차트를 create  해야할지 하나를 만들어서 사용할 수 있는지에 대한 것입니다.
강사 김대경 님이 모두에게:    오후 1:26
네..질문하신 내용들에 대해 종합해서 정리해 말씀드리도록 하겠습니다.
BS_장준표 님이 모두에게:    오후 1:36
강사님 이전 강의자료도 swedu에 올려 주실수 있나요?
강사 김대경 님이 모두에게:    오후 1:37
네..pdf로 변환해 올려드리도록 하겠습니다.
BS_장준표 님이 모두에게:    오후 1:37
감사합니다.
vs하창완 님이 모두에게:    오후 2:15
윈도우에서 kuberentes 연결해서 docker안쓰고 python script만 업데이트하면서 쓰고 싶은데..가능할까요?
vs하창완 님이 모두에게:    오후 2:18
윈도우 툴에 대한 의존성이 있고, 하나의 노드에 하나의 프로그램만 써야 해서요.
vs하창완 님이 모두에게:    오후 2:18
테스트 장비가 여러대인데.. 하드웨어하고 묶여있어서 여러개가 실행이 안되요
vs하창완 님이 모두에게:    오후 2:19
서버하나에 하나의 제품 hw가 있습니다.
vs하창완 님이 모두에게:    오후 2:20
테스트 구성하고 hw setting이 유동적이라. python 수행 script를 쿠버네티스에서 script 버젼에따라 관리를 한번 해보고싶어서요. 
vs하창완 님이 모두에게:    오후 2:22
넵
vs하창완 님이 모두에게:    오후 2:25
아. 넵 
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:51
강사님, 질문이 하나 있습니다. 예를들어 동일한 webserver를 replica를 이용해서 5개의 pod을 띄웠다고 했을 때, 외부에서 접속할때 실제 어디로 접속하게 되는지는 kube가 알아서 벨런싱 해주는건가요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:51
그걸 가능하게 해주는게 loadbalancer인건인지요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:53
nodeport를 사용할 경우에는 pod마다 외부 port를 무조건 다르게 지정해줘야 하는건지요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:54
두개의 차이가 무엇인지 궁금합니다
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:58
음.. 내부 아이피:포트를 외부로 포워딩 해주는 개념은 이해하였는데, 동일한 pod이 여러개 있을 때 실제로 어디로 접속되는지가 궁금했었습니다. 그건 kube가 알아서 해준다고 이해하면 되는것이지요?
민경직/선임/webOS Platform Task 님이 모두에게:    오후 2:58
감사합니다
강사 김대경 님이 모두에게:    오후 3:20
참 위 코드는 /templates/configmap.yaml 파일의 형식으로 사용하게 됩니다.
강사 김대경 님이 모두에게:    오후 3:20
관련 자료 url: https://helm.sh/ko/docs/chart_template_guide/getting_started/
구세완 님이 모두에게:    오후 3:24
감사합니다... 혹시 지금까지 적용해보신 것 중에서 직접 레퍼런스할 수 있는 것이 있으면 공유부탁드리며, 아니면 일단 인지만 하고 있겠습니다.
강사 김대경 님이 모두에게:    오후 3:25
안녕하세요?
강사 김대경 님이 모두에게:    오후 3:26
네 swedu에 올려드리도록 하겠습니다.
