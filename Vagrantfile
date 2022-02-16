# -*- mode: ruby -*-
# vi: set ft=ruby :

PRIVATE_KEY = "~/.ssh/id_rsa"
PUBLIC_KEY  = '~/.ssh/id_rsa.pub'
DOMAIN = 'vsphere.lab'

# INTERNAL NETWORK - 172.16.100.0/24
VYOS01_INTERNAL_IP = "172.16.100.101" # configured as .1 by ansible
DNSMASQ01_INTERNAL_IP = "172.16.100.11"
REMOTEDESKTOP01_INTERNAL_IP = "172.16.100.12"
NFS01_INTERNAL_IP = "172.16.100.13"

# PUBLIC NETWORK - 192.168.0.0/24
VYOS01_PUBLIC_IP = "192.168.0.101"

# CONFIGURES INTERNAL DEFAULT GATEWAY
$script_route = <<-SCRIPT
route add default gw 172.16.100.1
eval `route -n | awk '{ if ($8 =="eth0" && $2 != "0.0.0.0") print "route del default gw " $2; }'`
SCRIPT

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false
  config.ssh.private_key_path = [PRIVATE_KEY, "~/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source: PUBLIC_KEY, destination: "~/.ssh/authorized_keys"

  config.vm.define 'vyos01' do |vyos01|
    vyos01.vm.box = "letenkov/vyos"

    vyos01.vm.network :forwarded_port, guest: 22, host: 11122, id: 'ssh'

    vyos01.vm.network "public_network", ip: VYOS01_PUBLIC_IP, auto_config: false
    vyos01.vm.network "private_network", ip: VYOS01_INTERNAL_IP, auto_config: false

    vyos01.vm.synced_folder ".", "/vagrant", disabled: true  

    vyos01.vm.provider "virtualbox" do |v|
      v.memory = "1024"
      v.cpus = "1"
      v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end 
  
  config.vm.define 'dnsmasq01' do |dnsmasq01|
    
    dnsmasq01.vm.box = "oraclebase/oracle-8"

    dnsmasq01.vm.host_name = "dnsmasq-server." + DOMAIN

    dnsmasq01.vm.network "private_network", ip: DNSMASQ01_INTERNAL_IP, auto_config: true
    
    dnsmasq01.vm.synced_folder ".", "/vagrant", disabled: true

    dnsmasq01.vm.provision "shell", run: "always", inline: $script_route

    dnsmasq01.vm.provider "virtualbox" do |v|
      v.memory = "1024"
      v.cpus = "1"
      v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end

  config.vm.define 'nfs01' do |nfs01|
    
    nfs01.vm.box = "oraclebase/oracle-8"

    nfs01.vm.host_name = "nfs-server." + DOMAIN

    nfs01.vm.network "private_network", ip: NFS01_INTERNAL_IP, auto_config: true
    
    nfs01.vm.synced_folder ".", "/vagrant", disabled: true

    nfs01.vm.provision "shell", run: "always", inline: $script_route

    nfs01.vm.provider "virtualbox" do |v|
      v.memory = "1024"
      v.cpus = "1"
      v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end

  config.vm.define 'remotedesktop01' do |remotedesktop01|
    
    remotedesktop01.vm.box = "oraclebase/oracle-8"

    remotedesktop01.vm.host_name = "remote-desktop." + DOMAIN
    remotedesktop01.vm.network :forwarded_port, guest: 22, host: 11222, id: 'ssh'
    #remotedesktop01.vm.network :forwarded_port, guest: 5901, host: 5901

    remotedesktop01.vm.network "private_network", ip: REMOTEDESKTOP01_INTERNAL_IP, auto_config: true
    
    remotedesktop01.vm.synced_folder ".", "/vagrant", disabled: true

    remotedesktop01.vm.provision "shell", run: "always", inline: $script_route

    remotedesktop01.vm.provider "virtualbox" do |v|
      v.memory = "4096"
      v.cpus = "2"
      v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end

end
