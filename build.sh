#!/bin/bash

buildah bud \
  --device=/dev/kvm:/dev/kvm \
  --device=/dev/fuse:/dev/fuse \
  --security-opt label=disable \
  --security-opt seccomp=unconfined \
  --cap-add all \
  --userns-uid-map=1000:0:1 \
  --userns-uid-map 0:1:1000 \
  --userns-uid-map 1001:1001:64536 \
  -t awesometest:latest