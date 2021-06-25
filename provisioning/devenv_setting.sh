#!/bin/bash


mkdir /home/vagrant/tmp

# go install
curl -L https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -o /home/vagrant/tmp/go.tar.gz
tar -C /usr/local/ -xzf /home/vagrant/tmp/go.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bash_profile

source /home/vagrant/.bash_profile

# git
git config --global user.name "JaehoonKim"
git config --global user.email "jaehoon@gmail.com"
git config --global core.editor vim
git config --global core.commentchar "*"



#Source="/data/source/"
#mkdir -p $Source

# elk stack compose file download
#cd $Source


## Get the dcs from docker
#curl -sL bit.ly/ralf_dcs -o ./dcs
#sudo chmod 755 ./dcs
#sudo mv ./dcs /usr/bin/dcs



## Config for the ElasticSearch
#echo "vm.max_map_count=262144" >> /etc/sysctl.conf
#sysctl -w vm.max_map_count=262144
