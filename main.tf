terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "rocky_linux_vm" {
  name           = "RockyLinuxVM"
  image          = var.vmdk_image_path
  cpus           = 2
  memory         = "2048 mib"
  network_adapter {
    type = "bridged"
    host_interface = "wlp2s0"
  }
}
