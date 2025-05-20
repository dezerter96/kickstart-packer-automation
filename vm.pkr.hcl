packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "rocky_linux" {
  iso_url                 = "/home/dexter/Dokumenty/iso/Rocky-9.4-x86_64-minimal.iso"
  iso_checksum            = "sha256:ee3ac97fdffab58652421941599902012179c37535aece76824673105169c4a2"
  headless                = true
  format = "ovf"
  export_opts = [
    "--ovf20",  
    "--manifest"
  guest_os_type           = "RedHat_64"
  ssh_username            = "root"
  ssh_password            = "server"
  ssh_timeout             = "1500s"
  cpus                    = 2
  memory                  = 2048
  disk_size               = 20000
  hard_drive_interface    = "sata"
  boot_wait               = "5s"
  boot_command            = [
    "<tab> inst.text inst.ks=cdrom:/ks.cfg<enter>"
  ]
  shutdown_command        = "echo 'server' | sudo -S shutdown -P now"

  cd_files                = ["ks.cfg"]
  cd_label                = "KICKSTART"
}

build {
  sources = ["source.virtualbox-iso.rocky_linux"]
}