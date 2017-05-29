for srv in osobuild;
do 
  echo $srv; 
  ssh-copy-id root@$srv;
  ssh-copy-id $srv;
  ssh root@$srv systemctl disable firewalld;
  ssh root@$srv systemctl stop firewalld;
  ssh root@$srv sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
  ssh root@$srv hostnamectl set-hostname $srv
  ssh root@$srv "echo 'mtanino		ALL=(ALL)	NOPASSWD: ALL' >> /etc/sudoers"
  scp ./kubernetes.repo root@$srv:/etc/yum.repos.d/
  ssh root@$srv yum install -y docker rsyslog zsh go
  ssh root@$srv systemctl enable docker
  ssh root@$srv systemctl start docker
  scp export.sh mtanino@$srv:/home/mtanino
  ssh mtanino@$srv bash ~/export.sh
  ssh mtanino@$srv mkdir -p $GOPATH/src/github.com/openshift
  ssh mtanino@$srv "cd $GOPATH/src/github.com/openshift; git clone https://github.com/openshift/origin.git"
  ssh mtanino@$srv "cd $GOPATH/src/github.com/openshift/origin; git remote add upstream git://github.com/openshift/origin"
  #ssh root@$srv reboot
done
