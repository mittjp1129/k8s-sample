
for srv in ose3-master ose3-node1 ose3-node2;
do 
  echo $srv; ssh-copy-id root@$srv;
  ssh root@$srv systemctl disable firewalld;
  ssh root@$srv systemctl stop firewalld;
  ssh root@$srv sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
  ssh root@$srv yum -y update
  ssh root@$srv yum install -y epel-release
  ssh root@$srv yum -y install wget git net-tools bind-utils iptables-services bridge-utils bash-completion docker pyOpenSSL
  ssh root@$srv sed -i -e "s@OPTIONS='--selinux-enabled --log-driver=journald'@OPTIONS=' --selinux-enabled --insecure-registry=172.30.0.0/16 --log-driver=json-file --log-opt max-size=100m'@g" /etc/sysconfig/docker
  ssh root@$srv systemctl enable docker
  ssh root@$srv systemctl start docker
  ssh root@$srv reboot
done

# Enable shedule for master
#oadm manage-node ose3-master --schedulable=true

# reference
# http://jp-redhat.com/openeye_online/column/omizo/2856/
# https://docs.openshift.org/latest/install_config/install/advanced_install.html
