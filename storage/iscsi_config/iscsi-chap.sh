sudo targetcli /backstores/fileio create name=file_backend file_or_dev=/var/lib/libvirt/images/iscsi_disk1.img size=1G
sudo targetcli /iscsi create iqn.2017-05.com.example:rhel7
sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1/luns create /backstores/fileio/file_backend
sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1/acls create iqn.1994-05.com.redhat:185ce16b55ad
#sudo targetcli /iscsi set discovery_auth enable=1
#sudo targetcli /iscsi set discovery_auth userid=mtanino
#sudo targetcli /iscsi set discovery_auth password=password
#sudo targetcli /iscsi set discovery_auth mutual_userid=mtanino
#sudo targetcli /iscsi set discovery_auth mutual_password=password

sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1 set attribute authentication=1
sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1/acls/iqn.1994-05.com.redhat:185ce16b55ad set auth userid=mtanino
sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1/acls/iqn.1994-05.com.redhat:185ce16b55ad set auth password=password
#sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1 set auth mutual_userid=OutgoingUser2
#sudo targetcli /iscsi/iqn.2017-05.com.example:rhel7/tpg1 set auth mutual_password=AnotherPassword4
