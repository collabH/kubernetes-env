#!/usr/bin/env bash
##
## @desc:flink session mode with flink-kubernetes-native
## @author: echo huang
## @date: 2022-10-24 21:02:56
##

# start flink session
kubernetes-session.sh -n flink-native-kubernetes -Dkubernetes.cluster-id=flink-session-cluster

# submit job
flink run \
    --target kubernetes-session \
    -Dkubernetes.cluster-id=flink-session-cluster \
    ./examples/streaming/TopSpeedWindowing.jar

# stop flink session and delete deployment
kubectl delete deployment/flink-session-cluster -n flink-native-kubernetes