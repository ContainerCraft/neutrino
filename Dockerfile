FROM quay.io/coreos-assembler/coreos-assembler:latest

USER root

WORKDIR /srv

COPY kubernetes-upstream.repo /etc/yum.repos.d/kubernetes.repo

RUN dnf reposync --download-metadata -n --repoid=kubernetes-upstream -y

RUN sed -i "s/<timestamp>.*<\/timestamp>/<timestamp>$(date +%s)<\/timestamp>/g" kubernetes-upstream/repodata/repomd.xml

COPY * /srv/src/config/

COPY fedora-coreos-config/ /srv/src/config/fedora-coreos-config/

WORKDIR /srv/build

RUN cosa init /srv/src/config

RUN cosa fetch

RUN cosa build --force