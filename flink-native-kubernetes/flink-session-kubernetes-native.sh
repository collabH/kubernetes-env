#!/usr/bin/env bash
##
## @desc:flink session mode with flink-kubernetes-native
## @author: echo huang
## @date: 2022-10-24 21:02:56
##

# start flink session
kubernetes-session.sh  -Dkubernetes.cluster-id=flink-session-cluster -Dkubernetes.rest-service.exposed.type=NodePort \
-Dkubernetes.namespace=flink-native-kubernetes -Dkubernetes.service-account=flink \
-Dkubernetes.jobmanager.cpu=0.2 \
-Djobmanager.memory.process.size=1024m \
-Dresourcemanager.taskmanager-timeout=3600000 \
-Dkubernetes.taskmanager.cpu=0.2 \
-Dtaskmanager.memory.process.size=1024m \
-Dtaskmanager.numberOfTaskSlots=3
# submit job
flink run \
    --target kubernetes-session  \
    -Dkubernetes.cluster-id=flink-session-cluster \
    -Dkubernetes.namespace=flink-native-kubernetes -Dkubernetes.service-account=flink \
    ./examples/streaming/TopSpeedWindowing.jar

# stop flink session and delete deployment
kubectl delete deployment/flink-session-cluster -n flink-native-kubernetes