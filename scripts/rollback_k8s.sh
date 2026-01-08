#!/bin/bash
DEPLOYMENT_NAME=$1
NAMESPACE=$2
echo "Rolling back Kubernetes deployment: $DEPLOYMENT_NAME in namespace: $NAMESPACE"
kubectl rollout undo deployment $DEPLOYMENT_NAME -n $NAMESPACE
