
for srv in k8s-master k8s-node1 k8s-node2;
do 
  echo $srv; ssh-copy-id root@$srv;
  ssh root@$srv systemctl disable firewalld;
  ssh root@$srv systemctl stop firewalld;
  ssh root@$srv sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
  scp ./kubernetes.repo root@$srv:/etc/yum.repos.d/
  ssh root@$srv yum install -y docker kubelet kubeadm kubectl kubernetes-cni
  ssh root@$srv systemctl enable docker
  ssh root@$srv systemctl start docker
  ssh root@$srv systemctl enable kubelet
  ssh root@$srv systemctl start kubelet
  ssh root@$srv reboot
done
