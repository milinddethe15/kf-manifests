#!/bin/bash
set -e

kustomize build apps/centraldashboard/upstream/overlays/kserve | kubectl apply -f -
kubectl wait --for=condition=Ready pods --all -n kubeflow --timeout=180s 