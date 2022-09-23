#!/usr/bin/env bash
##
## @desc:flink job savepoint operations
## @author: echo huang
## @date: 2022-09-23 19:42:22
##

# deploy job
kubectl apply -f savepoint-job.yaml -n flink-operator

# make savepoint
kubectl patch flinkdeployment/savepoint-job-ha --type=merge -p '{"spec": {"job": {"state": "suspended", "upgradeMode":"savepoint"}}}' -n flink-operator

# delete flinkdeployment
kubectl delete flinkdeployment/savepoint-job-ha -n flink-operator

# 修改yaml配置添加savepoint后重启,yaml中添加initialSavepointPath: file:///Users/huangshimin/Documents/study/k8s/flinkdata/savepoints/savepoint-000000-6ca63e5fc64b/_metadata
kubectl apply -f savepoint-job.yaml -n flink-operator

#成功标识 Starting job 00000000000000000000000000000000 from savepoint /flink-data/savepoints/savepoint-000000-2f40a9c8e4b9/_metadat
