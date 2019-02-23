# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant virtual environments for https://public-inbox.org
#
Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb, override|
    vb.name = "vagrant-public-inbox"
    vb.memory = "1024"
    vb.cpus = 2
    override.vm.box = "generic/debian9"
    override.vm.network "private_network", type: "dhcp"
    override.vm.network :forwarded_port, host: 80, guest: 80
  end

  config.vm.provider "hyperv" do |hv, override|
    hv.vmname = "vagrant-public-inbox"
    hv.memory = "1024"
    hv.cpus = 2
    override.vm.box = "generic/debian9"
    # Windows (Build 16237+) comes with "Default Switch" to allow VMs to NAT host internet (any!) connection
    # https://blogs.technet.microsoft.com/virtualization/2017/07/26/hyper-v-virtual-machine-gallery-and-networking-improvements/
    # Apparently, this is an undocumented workaround to specify Hyper-V network in Vagrantfile.
    # NOTE: By default, try the "Default Switch"
    #       Alternatively, comment this line and let Vagrant prompt you to select one from available Hyper-V Switch-es.
    override.vm.network "private_network", bridge: "Default Switch"
    #override.vm.network "public_network", bridge: "External Switch"
  end

  scripts = [ "bootstrap.sh" ]
  scripts.each { |script|
    config.vm.provision :shell, privileged: false, :path => "./" << script
  }
end
