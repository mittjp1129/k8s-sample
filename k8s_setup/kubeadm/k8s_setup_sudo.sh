  srv=$1
  echo $srv; ssh-copy-id $srv;
  ssh $srv sudo systemctl disable firewalld;
  ssh $srv sudo systemctl stop firewalld;
  ssh $srv sudo sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
  scp ./kubernetes.repo $srv:~/
  ssh $srv sudo cp ./kubernetes.repo /etc/yum.repos.d/
  ssh $srv sudo yum install -y docker kubelet kubeadm kubectl kubernetes-cni
  ssh $srv sudo systemctl enable docker
  ssh $srv sudo systemctl start docker
  ssh $srv sudo systemctl enable kubelet
  ssh $srv sudo systemctl start kubelet
  ssh $srv sudo reboot
