#!/bin/bash

buildah bud \
  --device=/dev/kvm:/dev/kvm \
  --device=/dev/fuse:/dev/fuse \
  --security-opt label=disable \
  --security-opt seccomp=unconfined \
  --cap-add SYS_ADMIN \
  --cap-add CAP_NET_ADMIN \
  -t awesometest:latest