  srv=$1
  echo $srv; ssh-copy-id $srv;
  ssh $srv sudo apt-get update
  ssh $srv sudo apt-get install -y apt-transport-https --allow-unauthenticated
  ssh $srv sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  scp ./kubernetes.list $srv:~/
  ssh $srv sudo cp ./kubernetes.list /etc/apt/sources.list.d/
  ssh $srv sudo apt-get update

  # Install docker if you don't have it already.
  ssh $srv sudo apt-get install -y docker-engine --allow-unauthenticated
  ssh $srv sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni --allow-unauthenticated

  #ssh $srv sudo reboot
