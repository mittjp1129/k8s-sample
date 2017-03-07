# NFS server configuration for k8s volume
sudo mkdir /public
sudo chmod 777 /public
echo "/public *(rw,no_root_squash)" | sudo tee --append /etc/exports > /dev/null
sudo exportfs -ra
sudo exportfs

sudo systemctl start rpcbind nfs-server 
sudo systemctl enable rpcbind nfs-server 
