#!/usr/bin/env bash
##
## @desc:install kubernetes dashboard
## @author: echo huang
## @date: 2022-09-19 21:35:32
##

# 部署dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml
# 开启本机访问代理，访问dashboard ui
kubectl proxy

# 获取登陆 token
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-admin | awk '{print $1}')

# 如果获取不到，则创建token
kubectl create token kubernetes-dashboard-admin -n kubernetes-dashboard

# http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/