for SERVICES in docker kube-proxy.service kubelet.service; do 
    systemctl restart $SERVICES
    systemctl enable $SERVICES
    systemctl status $SERVICES 
done
