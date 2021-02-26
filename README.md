# Neutrino
a viable particle of bits permeating all compute

## Objective:
Ready to run Bare Metal Live/Ephemeral K8s Container OS with all built in Dependencies

Dependencies:
  - CRIO
  - Kubectl
  - Kubeadm
  - Flannel

## Dev status

Super dirty right now. Completely broken. But the images are built with the Dockerfile. These flags obviously make no sense.

```
buildah bud --device=/dev/kvm:/dev/kvm --device=/dev/fuse:/dev/fuse --security-opt label=disable --security-opt seccomp=unconfined --cap-add SYS_ADMIN -t awesometest:latest
```