terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "libvirt" {
  uri = "qemu+ssh://user@lpm-server.feri.um.si/system"
}

module "images" {
  source = "../modules/images"
  machines_path = "../../machines"
}

module "network" {
  source = "../modules/network"
}

output "base_image_id" {
  value = module.images.base_image_id
}

output "private_network_id" {
  value = module.network.private_network_id
}
