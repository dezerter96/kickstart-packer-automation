packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/virtualbox"
    }
    vagrant = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "virtualbox-iso" "rocky_linux" {
  iso_url                 = "/home/dexter/Dokumenty/iso/Rocky-9.4-x86_64-dvd.iso"
  iso_checksum            = "sha256:e20445907daefbfcdb05ba034e9fc4cf91e0e8dc164ebd7266ffb8fdd8ea99e7"
  headless                = true
  guest_os_type           = "RedHat_64"
  ssh_username            = var.ssh_username
  ssh_password            = var.ssh_password
  ssh_timeout             = "1500s"
  cpus                    = 2
  memory                  = 2048
  disk_size               = 30000
  hard_drive_interface    = "sata"
  guest_additions_mode    = "attach"
  guest_additions_url     = "file:///usr/share/virtualbox/VBoxGuestAdditions.iso"
  guest_additions_path    = "/root/VBoxGuestAdditions.iso"
  boot_wait               = "5s"
  boot_command            = [
    "<tab> inst.text inst.ks=cdrom:/ks.cfg<enter>"
  ]
  shutdown_command        = "echo 'server' | sudo -S shutdown -P now"
  shutdown_timeout        = "15m"

  cd_files                = ["ks.cfg"]
  cd_label                = "KICKSTART"

  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--graphicscontroller", "vmsvga"],
    ["modifyvm", "{{.Name}}", "--vram", "16"]
  ]
}

build {
  sources = ["source.virtualbox-iso.rocky_linux"]
 
  post-processor "vagrant" {
    output = "rocky_linux_{{.Provider}}.box"
  }
}
