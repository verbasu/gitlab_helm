#!/bin/bash
#
helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
   --timeout 600s -n gitlab \
   --set global.hosts.domain=example.com --set global.registry.enabled=false --set registry.enabled=false \
   --set global.hosts.externalIP=192.168.39.160 --set upgradeCheck.enabled=false \
   --set certmanager-issuer.email=me@example.com --set prometheus.install=false --set prometheus.rbac.create=false \
   --set postgresql.image.tag=13.6.0 \
   --set global.edition=ce --version=7.6.1
