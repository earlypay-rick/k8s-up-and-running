#!/usr/bin/env bash

ARCH="$(dpkg --print-architecture)"

K9S_VERSION="0.32.4"

sudo apt-get update && sudo apt-get install -y \
  bash-completion

# Install K9s
wget --output-document /tmp/k9s.deb "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_linux_${ARCH}.deb" \
  && sudo dpkg --install /tmp/k9s.deb \
  && rm -f /tmp/k9s.deb

echo "
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

source <(kubectl completion bash)
source <(helm completion bash)
source <(minikube completion bash)
source <(k9s completion bash)

alias h='helm'
alias K='k9s'
alias k='kubectl'
alias kk='kubectl kustomize'
alias mk='minikube'
" >>~/.bashrc