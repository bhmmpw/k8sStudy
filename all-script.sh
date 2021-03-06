### 쿠버네티스 스토리지 관리

cat > hue-scheduler.yaml
apiVersion: v1
kind: Pod
metadata:
  name: hue-scheduler
spec:
  containers:
  - image: tomcat:8
    name: hue-global-listener
    volumeMounts:
    - mountPath: /notifications
      name: shared-volume
  - image: httpd:2
    name: hue-job-scheduler
    volumeMounts:
    - mountPath: /incoming
      name: shared-volume
  volumes:
  - name: shared-volume
    emptyDir: {}


cat > hostpath-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-pod
spec:
  containers:
    - name: my-container
      image: busybox
      args: [ "tail", "-f", "/dev/null" ]
      volumeMounts:
      - name: my-hostpath-volume
        mountPath: /etc/data
  volumes:
    - name: my-hostpath-volume
      hostPath:
        path: /tmp


와 비교

cat > hostpath-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-pod
spec:
  containers:
    - name: my-container
      image: busybox
      args: [ "tail", "-f", "/dev/null" ]
      volumeMounts:
      - name: my-hostpath-volume
        mountPath: /etc/data
      securityContext:
        privileged: true
  volumes:
    - name: my-hostpath-volume
      hostPath:
        path: /tmp


cat > local-storage-class.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-storage
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer




cat > hostpath-pv.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-volume
spec:
  storageClassName: manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /tmp


cat > my-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi


cat > use-pvc.yaml
apiVersion: v1
kind: Pod
metadata:
  name: use-pvc
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - mountPath: /test-volume
      name: vol
  volumes:
  - name: vol
    persistentVolumeClaim:
      claimName: my-pvc

cat > my-pvc-sc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc-sc
spec:
  storageClassName: local-path
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi



cat > use-pvc-sc.yaml
apiVersion: v1
kind: Pod
metadata:
  name: use-pvc-sc
spec:
  volumes:
  - name: vol
    persistentVolumeClaim:
      claimName: my-pvc-sc
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - mountPath: "/usr/share/nginx/html"
      name: vol




cat > deny-all.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: deny-all
  namespace: default
spec:
  podSelector: {}
  ingress: []


cat > web-open.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: web-open
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: web
  ingress:
  - from:
    - podSelector: {}
    ports:
    - protocol: TCP
      port: 80


cat > allow-from-web.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: allow-from-web
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: app
  ingress:
  - from:
    - podSelector:
        matchLabels:
          run: web



cat > db-accessable.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: db-accessable
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: db
  ingress:
  - from:
    - podSelector:
        matchLabels:
          db-accessable: "true"
    ports:
    - protocol: TCP
      port: 80



cat > allow-dmz.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: allow-dmz
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: web
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          zone: dmz
    ports:
    - protocol: TCP
      port: 80

cat > dont-leave-dev.yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: dont-leave-dev
  namespace: dev
spec:
  podSelector: {}
  egress:
  - to:
    - podSelector: {}


cat > full-network-policy
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: full-network-policy
  namespace: default
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24
    - namespaceSelector:
        matchLabels:
          project: dev
    - podSelector:
        matchLabels:
          role: web
    ports:
    - protocol: TCP
      port: 3306
  egress:
  - to:
    - ipBlock:
        cidr: 10.0.0.0/24
    ports:
    - protocol: TCP
      port: 53


cat > api-gateway.yaml
apiVersion: v1
kind: Service
metadata:
  name: api-gateway
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 5000
  selector:
    svc: api-gateway
    app: delinkcious


cat > hello-application.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
spec:
  selector:
    matchLabels:
      run: load-balancer-example
  replicas: 2
  template:
    metadata:
      labels:
        run: load-balancer-example
    spec:
      containers:
        - name: hello-world
          image: gcr.io/google-samples/node-hello:1.0
          ports:
            - containerPort: 8080
              protocol: TCP

