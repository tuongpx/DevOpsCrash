#!/usr/bin/env bash
# bash completion support for core Kubernetes.

alias ..='cd ..'
# source <(kubectl completion bash)
# source <(kubeadm completion bash)
# source <(crictl completion bash)
# source <(helm completion bash)

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion bash)
fi

if command -v kubeadm >/dev/null 2>&1; then
    source <(kubeadm completion bash)
fi

if command -v crictl >/dev/null 2>&1; then
    source <(crictl completion)
fi

if command -v helm >/dev/null 2>&1; then
    source <(helm completion bash)
fi
