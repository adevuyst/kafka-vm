# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "deb" do |deb|
    deb.vm.box = "ubuntu/trusty64"
    deb.vm.network "forwarded_port", guest: 9092, host: 9092
    deb.vm.network "forwarded_port", guest: 8081, host: 8081
    deb.vm.provision "shell", path: "vagrant/deb.sh"
    deb.vm.provision "shell", path: "start.sh", run: "always", privileged: false
    deb.vm.provision "shell", path: "setup.sh", run: "always", privileged: false

  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

end
