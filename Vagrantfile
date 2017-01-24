required = ["vagrant-docker-compose", "vagrant-cachier", "vagrant-hostmanager"]

restart = false
for req in required
    unless Vagrant.has_plugin?(req)
      system("vagrant plugin install #{req}")
      puts "Dependencies #{req} installed."
      restart = true
    end
end

if restart then
    puts "Dependencies installed, please relaunch vagrant up."
    exit
end


Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", run: "always"
  config.vm.provision :shell, path: "bootstrap.sh"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define 'default' do |node|
      node.vm.hostname = 'web-devbox'
      node.vm.network "private_network", ip: "172.254.123.15"

      node.hostmanager.aliases = %w(php5.web-devbox.local php7.web-devbox.local pma.web-devbox.local mailhog.web-devbox.local web-devbox.local)
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
end
