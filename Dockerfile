FROM quay.io/coreos-assembler/coreos-assembler:latest AS build-stage

# Setup Directories and stage scripts
WORKDIR /srv

COPY kubernetes-upstream.repo /etc/yum.repos.d/kubernetes.repo

RUN dnf reposync --download-metadata -n --repoid=kubernetes -y

RUN sed  "s/<timestamp>.*<\/timestamp>/<timestamp>$(date +%s)<\/timestamp>/g" kubernetes/repodata/repomd.xml

COPY * /srv/src/config/

WORKDIR /build

RUN cosa init https://github.com/coreos/fedora-coreos-config.git

RUN cosa fetch

RUN cosa build