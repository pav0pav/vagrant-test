Vagrant.configure("2") do |config|
    config.vm.define "06-CONNECT-IT-4-ATE" do
      config.vm.provider "docker" do |d|
        d.build_dir = "."
        d.remains_running = true
        d.has_ssh = true
        d.name = "06-CONNECT-IT-4-ATE"
      end
      config.vm.synced_folder "06/", "/home/vagrant/vagrant_data", docker_consistency: "cached"  
    end
  end