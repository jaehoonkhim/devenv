#!/bin/bash
# Script for Default env. of zinst
#!/bin/bash
LANG=en_US.UTF-8
#sed -i '/^LANG=/d' /etc/sysconfig/i18n
#echo 'LANG=en_US.UTF-8' >> /etc/sysconfig/i18n
#sed -i 's/=enforcing/=disabled/g' /etc/selinux/config

#setenforce 0
apt-get update
apt-get install build-essential -y
apt-get install net-tools -y
apt-get install curl -y
apt-get install wget -y
apt-get install vim -y

# ssh allow
sed  -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sed  -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

systemctl restart sshd

mkdir -p /home/vagrant/.ssh
cp -Rfv /tmp/conf.d/* /home/vagrant/.ssh
echo "alias ll='ls -lia' " >> /home/vagrant/.bash_profile

