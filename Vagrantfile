# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.a

######## VirtualBox Box image name
OS_NAME="ubuntu/focal64"

VAGRANTFILE_API_VERSION = "2"
NODE_COUNT = 1 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provision "shell", path: "./provisioning/default_setting.sh", args: ""
  config.vm.synced_folder "~/.ssh/", "/tmp/conf.d/"
  config.disksize.size = "50GB"
  ## For Docker instance  
  NODE_COUNT.times do |i|
    node_id = "dev0#{i}"
    config.vm.define node_id do |node|
      node.vm.provision "shell", path: "./provisioning/docker.sh", args: ""
      node.vm.provision "shell", path: "./provisioning/devenv_setting.sh", args: ""
      node.vm.network "private_network", ip: "192.168.10.2#{i}"
      node.vm.box = OS_NAME
      node.vm.hostname = "#{node_id}"
    end
  end
    
  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end 
end