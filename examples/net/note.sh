#!/bin/bash

exit 0

kubectl run hello-web --labels app=hello --image=gcr.io/google-samples/hello-app:1.0 --port 8080 --expose

k apply -f hello-allow-from-foo.yaml
k get networkpolicy.networking.k8s.io
