etcdctl set coreos.com/network/config < flannel-config.json
etcdctl get coreos.com/network/config
curl -s -L http://k8s-master:2379/v2/keys/coreos.com/network/config | python -mjson.tool
