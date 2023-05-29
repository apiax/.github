#!/usr/bin/env bash

AWS_REGION=eu-central-1
VERSION_KUBECTL=1.25.9
PLATFORM=amd64

curl -sS "https://webi.sh/k9s" | sh \
  && curl -sS "https://webi.sh/kubectx" | sh \
  && curl -O "https://s3.${AWS_REGION}.amazonaws.com/amazon-eks/${VERSION_KUBECTL}/2023-05-11/bin/linux/${PLATFORM}/kubectl"
