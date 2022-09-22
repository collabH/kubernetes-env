#!/usr/bin/env bash
##
## @desc:deploy flink job
## @author: echo huang
## @date: 2022-09-22 15:27:32
##

## deploy job
kubectl apply -f flink-job-with-ingress-nginx.yaml -n flink-operator
# 通过http://localhost/flink-operator/advanced-ingress 访问flink web dashboard

## delete job
kubectl delete flinkdeployments/advanced-ingress -n flink-operator