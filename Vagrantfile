# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Creating a general base setup for all machines
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "2"
  end

  # Creating the master node
  config.vm.define "master" do |subconfig|
    # specifying the box/image
    subconfig.vm.box = "ubuntu/focal64"
    # specifying the hostname
    subconfig.vm.hostname = "master"
    # specifying the network type
    subconfig.vm.network "private_network", ip: "192.168.35.101"

    # Provision script for just the master only
    subconfig.vm.provision "shell", inline: <<-SHELL
      # Creating the user Altschool
      sudo useradd -m -s /bin/bash Altschool
      # Granting Altschool user sudo privileges
      sudo usermod -aG sudo Altschool

      # Generate SSH keys for Altschool on the Master node
      sudo -u Altschool ssh-keygen -t rsa -N "" -f /home/Altschool/.ssh/id_rsa

      # Copy the public key to the shared directory
      cp /home/Altschool/.ssh/id_rsa.pub /vagrant/master_ssh_key.pub
      
    SHELL

  end

  # Creating the slave node (same base specifications as the master)
  config.vm.define "slave" do |subconfig|
    subconfig.vm.box = "ubuntu/focal64"
    subconfig.vm.hostname = "slave"
    subconfig.vm.network "private_network", ip: "192.168.35.102"

    # Provision script for just the slave only
    subconfig.vm.provision "shell", inline: <<-SHELL
      # Creating the user Altschool on the Slave node
      sudo useradd -m -s /bin/bash Altschool
      # Granting Altschool user sudo privileges on the Slave node
      sudo usermod -aG sudo Altschool

      # Create SSH directory for Altschool on the Slave node
      sudo -u Altschool mkdir -p /home/Altschool/.ssh
      sudo -u Altschool chmod 700 /home/Altschool/.ssh

      # Copy SSH public key from the shared folder to authorized_keys
      cat /vagrant/master_ssh_key.pub >> /home/Altschool/.ssh/authorized_keys


    SHELL

  end
  
end

