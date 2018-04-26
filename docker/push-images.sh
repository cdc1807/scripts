#!/bin/bash

old_repo=registry.ng.bluemix.net/mdelder
new_repo=mycluster.icp:8500/platform


# images=(
# "kubernetes:v1.10.0"
# )

images=(
"icp-inception:compton"
"kubernetes:v1.10.0"
"kubernetes:v1.8.3"
"calico-cni:v2.0.1"
"calico-ctl:v2.0.1"
"calico-node:v3.0.3"
"calico-kube-controllers:v2.0.1"
"filebeat:5.5.1"
"pause:3.0"
"kube-state-metrics:v1.2.0"
"k8s-dns-dnsmasq-nanny:1.14.4"
"k8s-dns-kube-dns:1.14.4"
"k8s-dns-sidecar:1.14.4"
"alertmanager:v0.13.0"
"icp-catalog-ui:latest"
"icp-datastore:1.1.0"
"collectd-exporter:0.3.1"
"configmap-reload:v0.1"
"coredns:1.0.3"
"curl:3.6"
"elasticsearch:5.5.1"
"etcd:v3.2.14"
"heketi:5"
"icp-helm-api:latest"
"icp-helm-repo:latest"
"icp-initcontainer:1.0.0"
"icp-image-manager:2.2.1"
"registry:2"
"indices-cleaner:0.2"
"keepalived:1.2.24"
"kibana:5.5.1"
"logstash:5.5.1"
"icp-management-ingress:2.2.0"
"mariadb:10.1.16"
"metering-data-manager:latest"
"metering-reader:latest"
"metering-server:latest"
"metering-ui:latest"
"node-exporter:v0.15.2"
"opa:0.5.13"
"kube-mgmt:0.4"
"icp-platform-api:latest"
"icp-platform-auth:latest"
"iam-token-service:latest"
"icp-platform-deploy:latest"
"iam-policy-administration:latest"
"iam-policy-decision:latest"
"icp-identity-manager:latest"
"icp-identity-provider:latest"
"icp-platform-ui:latest"
"prometheus:v2.0.0"
"rescheduler:v0.5.2"
"icp-router:2.2.0"
"service-catalog-service-catalog:v0.1.2"
"tiller:v2.7.3-icp"
"icp-helm-rudder:latest"
"ucarp:1.5.2"
"unified-router:2.2.0"
"icp-vip-manager:1.0"
"sas-api:1.2.0"
"sas-mgmt:1.2.0"
"compliance-annotator:1.2.0"
"config-parser:1.2.0"
"py-config-indexer:1.2.0"
"py-generic-indexer:1.2.0"
"livescan-proxy:1.2.0"
"notification-dispatcher:1.2.0"
"password-annotator:1.2.0"
"rootkit-annotator:1.2.0"
"vulnerability-annotator:1.2.0"
"usncrawler:1.2.0"
"metrics-crawler:1.2.0"
"reg-crawler:1.2.0"
"live-crawler:1.2.0"
"va-elasticsearch-curator:5.4.1"
"kafka:0.10.0.1"
"k8szk:v2"
"statsd:0.7.2"
)

set -x
for i in ${images[@]}; do
    image="$new_repo/$i"
    docker pull "$old_repo/$i"
    docker tag "$old_repo/$i" "$image"
    docker push "$image"
    docker rmi "$image"
done
