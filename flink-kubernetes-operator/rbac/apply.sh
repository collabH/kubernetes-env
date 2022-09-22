#!/usr/bin/env bash
##
## @desc:apply rbac yaml
## @author: echo huang
## @date: 2022-09-21 20:46:43
##

# apply custom rbac configuration
kubectl create namespace flink-operator
kubectl apply -f flink-operator-rbac.yaml -n flink-operator