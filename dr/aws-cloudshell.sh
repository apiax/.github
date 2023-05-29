#!/usr/bin/env bash

AWS_REGION=eu-central-1
ARCH=amd64
PLATFORM=$(uname -s)_${ARCH}
# VERSION_KUBECTL=1.25.9

curl -sS https://webi.sh/k9s | sh
curl -sS https://webi.sh/kubectx | sh
# curl -sS https://webi.sh/vim-essentials | sh

# https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
# curl -sLO "https://s3.${AWS_REGION}.amazonaws.com/amazon-eks/${VERSION_KUBECTL}/2023-05-11/bin/linux/${ARCH}/kubectl"
# mv kubectl ~/.local/bin/kubectl

# https://github.com/weaveworks/eksctl/blob/main/README.md#for-unix
curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
curl -sL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_checksums.txt" | grep "${PLATFORM}" | sha256sum --check # (Optional) Verify checksum
tar -xzf "eksctl_${PLATFORM}.tar.gz" -C /tmp && rm "eksctl_${PLATFORM}.tar.gz"
mv /tmp/eksctl ~/.local/bin/eksctl

eksctl utils write-kubeconfig --region="${AWS_REGION}" --cluster=dev
eksctl utils write-kubeconfig --region="${AWS_REGION}" --cluster=qa
eksctl utils write-kubeconfig --region="${AWS_REGION}" --cluster=production
