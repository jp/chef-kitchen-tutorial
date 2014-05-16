# -*- mode: ruby -*-
# vi: set ft=ruby :
 
VAGRANTFILE_API_VERSION = "2"
$script = <<SCRIPT
# Silly Ubuntu 12.04 doesn't have the
# --stdin option in the passwd utility
echo root:vagrant | chpasswd
cat << EOF >> /etc/hosts
192.168.20.10 chef
192.168.20.12 centos
EOF
SCRIPT
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "precise64"
 
  # Turn off shared folders
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
 
  # Begin chef
  config.vm.define "chef" do |chef_config|
    chef_config.vm.hostname = "chef"
    chef_config.vm.provision "shell", inline: $script
    # eth1 configured in the 192.168.20.0/24 network
    chef_config.vm.network "private_network", ip: "192.168.20.10"
    chef_config.vm.provider "vmware_workstation" do |v|
        v.vmx["memsize"] = "2048"
        v.vmx["numvcpus"] = "1"
    end
    chef_config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = "2048"
        v.vmx["numvcpus"] = "1"
    end
    chef_config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2048"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
    end

  end
  # End chef
 
    # Begin centos
  config.vm.define "centos" do |centos_config|
    centos_config.vm.hostname = "centos"
    centos_config.vm.provision "shell", inline: $script
    centos_config.vm.box = "centos"
    centos_config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
    # eth1 configured in the 192.168.20.0/24 network
    centos_config.vm.network "private_network", ip: "192.168.20.12"
    centos_config.vm.provider "vmware_workstation" do |v|
        v.vmx["memsize"] = "2048"
        v.vmx["numvcpus"] = "2"
    end

    centos_config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = "2048"
        v.vmx["numvcpus"] = "2"
    end
    centos_config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "2048"]
        v.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  # End centos
end
