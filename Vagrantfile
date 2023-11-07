# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "jm-lab-srv01" do |subconfig|
        subconfig.vm.box = "hashicorp/bionic64"
        subconfig.vm.hostname = "srv01"
        subconfig.vm.provider "hyperv"
        subconfig.vm.network "public_network", bridge: "jm-lab-net"
        
        subconfig.vm.provider "hyperv" do |h|
            h.enable_virtualization_extensions = true   
            h.linked_clone = false
            h.vmname = "srv01"
        end
    end
        #subconfig.vm.provision "ansible" do |a|
        #    a.verbose = "v"
        #    a.playbook = "master_playbook.yaml"
        #end


            config.vm.define "jm-lab-srv02" do |subconfig|
                subconfig.vm.box = "hashicorp/bionic64"
                subconfig.vm.hostname = "srv02"
                subconfig.vm.provider "hyperv"
                subconfig.vm.network "public_network", bridge: "jm-lab-net"
        
                subconfig.vm.provider "hyperv" do |h|
                    h.enable_virtualization_extensions = true
                    h.linked_clone = true
                    h.vmname = "srv02"
                end
            end
      
                
    
            config.vm.define "jm-lab-srv03" do |subconfig|
                subconfig.vm.box = "hashicorp/bionic64"
                subconfig.vm.hostname = "srv03"
                subconfig.vm.provider "hyperv"
                subconfig.vm.network "public_network", bridge: "jm-lab-net"
                
                subconfig.vm.provider "hyperv" do |h|
                    h.enable_virtualization_extensions = true
                    h.linked_clone = true
                    h.vmname = "srv03"
                
                end
            end
      


            config.vm.define "jm-lab-srv03" do |subconfig|
                subconfig.vm.box = "hashicorp/bionic64"
                subconfig.vm.hostname = "srv03"
                subconfig.vm.provider "hyperv"
                subconfig.vm.network "public_network", bridge: "jm-lab-net"
                
                subconfig.vm.provider "hyperv" do |h|
                    h.enable_virtualization_extensions = false
                    h.linked_clone = true
                    h.vmname = "srv03"
                end
            end

    
        config.vm.define "jm-lab-srv04" do |subconfig|
            subconfig.vm.box = "hashicorp/bionic64"
            subconfig.vm.hostname = "srv04"
            subconfig.vm.provider "hyperv"
            subconfig.vm.network "public_network", bridge: "jm-lab-net"
            
            subconfig.vm.provider "hyperv" do |h|
                h.enable_virtualization_extensions = false
                h.linked_clone = true
                h.vmname = "srv04"
            end
        end

  
        config.vm.define "jm-lab-srv05" do |subconfig|
            subconfig.vm.box = "hashicorp/bionic64"
            subconfig.vm.hostname = "srv05"
            subconfig.vm.provider "hyperv"
            subconfig.vm.network "public_network", bridge: "jm-lab-net"
            
            subconfig.vm.provider "hyperv" do |h|
                h.enable_virtualization_extensions = true
                h.linked_clone = true
                h.vmname = "srv05"
            end
        end




        config.vm.define "jm-lab-srv06" do |subconfig|
            subconfig.vm.box = "hashicorp/bionic64"
            subconfig.vm.hostname = "srv06"
            subconfig.vm.provider "hyperv"
            subconfig.vm.network "public_network", bridge: "jm-lab-net"
            
            subconfig.vm.provider "hyperv" do |h|
                h.enable_virtualization_extensions = true
                h.linked_clone = true
                h.vmname = "srv06"
            end
        end

        
    end

