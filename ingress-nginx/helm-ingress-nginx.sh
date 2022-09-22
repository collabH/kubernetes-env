#!/usr/bin/env bash
##
## @desc:install kubernetes ingress-nginx
## @author: echo huang
## @date: 2022-09-21 19:57:46
##

# 【recommend】 use kubectl on yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml

# install nginx use helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx