#!/usr/bin/env bash
##
## @desc:install flink kubernetes operator
## @author: echo huang
## @date: 2022-09-14 21:05:54
##

# install cert-manager
kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.8.2/cert-manager.yaml
# add flink operator repo helm chart
helm repo add flink-operator-repo160 https://downloads.apache.org/flink/flink-kubernetes-operator-1.6.0/

# install flink operator use default helm chart conf
helm install flink-kubernetes-operator flink-operator-repo160/flink-kubernetes-operator