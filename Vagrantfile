# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # For ModernIE boxes, enter one of the following in config.vm.box:
  # Vista with IE 7:  modernIE/vista-ie7
  # Windows 7 with IE 11:  modernIE/w7-ie11
  # Windows 8 with IE 10:  modernIE/w8-ie10
  # Windows 8.1 with IE 11:  modernIE/w8.1-ie11
  # Windows 10 with IE 11 + Edge: modernIE/w10-edge 
  # config.vm.box = "modernIE/w7-ie11"
  
  # All of the available VM boxes for testing.
 config.vm.define "vista", autostart: false do |vista|
  vista.vm.box = "modernIE/vista-ie7"
  vista.vm.network "forwarded_port", host: 13389, guest: 3389, id: "rdp", auto_correct: true
  vista.vm.network "forwarded_port", host: 15985, guest: 5985, id: "winrm", auto_correct: true
 end
 
 config.vm.define "win7", primary: true, autostart: true do |win7|
  win7.vm.box = "modernIE/w7-ie11"
  win7.vm.network "forwarded_port", host: 23389, guest: 3389, id: "rdp", auto_correct: true
  win7.vm.network "forwarded_port", host: 25985, guest: 5985, id: "winrm", auto_correct: true
 end

 config.vm.define "win8", autostart: false do |win8|
  win8.vm.box = "modernIE/w8-ie10"
  win8.vm.network "forwarded_port", host: 33389, guest: 3389, id: "rdp", auto_correct: true
  win8.vm.network "forwarded_port", host: 35985, guest: 5985, id: "winrm", auto_correct: true
 end
 
 config.vm.define "win81", autostart: false do |win81|
  win81.vm.box = "modernIE/w8.1-ie11"
  win81.vm.network "forwarded_port", host: 43389, guest: 3389, id: "rdp", auto_correct: true
  win81.vm.network "forwarded_port", host: 45985, guest: 5985, id: "winrm", auto_correct: true
 end

 config.vm.define "win10", autostart: false do |win10|
  win10.vm.box = "modernIE/w10-edge"
  win10.vm.network "forwarded_port", host: 53389, guest: 3389, id: "rdp", auto_correct: true
  win10.vm.network "forwarded_port", host: 55985, guest: 5985, id: "winrm", auto_correct: true
 end

  # Change guests to Windows
 config.vm.guest = :windows
 
  # Change VM communication method to Windows.
  # Comment out if you are able to use SSH.
 config.vm.communicator = "winrm"
  
  # If using modernIE boxes, set the correct username and password.
  # Comment out if box has vagrant user.
 config.winrm.username = "IEUser"
 config.winrm.password = "Passw0rd!"
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
 config.vm.synced_folder "Vagrant_Share/", "/Vagrant_Share"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

 config.vm.provider "virtualbox" do |vb|
  # Display the VirtualBox GUI when booting the machine
  vb.gui = true
  # Customize the amount of memory on the VM:
  vb.memory = "2048"
  vb.cpus = 2
 end
  
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
 config.vm.provision "shell", inline: "choco install -y chocolatey"
 config.vm.provision "shell", inline: "choco install -y boxstarter 7zip.install PowerShell libreoffice notepadplusplus.install"
 config.vm.provision "shell", inline: <<-SHELL
  Import-Module Boxstarter.Chocolatey
  Update-ExecutionPolicy Unrestricted
  Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
  Enable-RemoteDesktop
  Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Notepad++\notepad++.exe"
  Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe"
 SHELL
  
end
