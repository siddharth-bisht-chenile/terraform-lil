resource "google_compute_network" "ll-network" {
  name = "ll-networking"
  auto_create_subnetworks = false
}

resource "aws_vpc" "ll-network" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "azurerm_resource_group" "ll-network" {
  location = "East US"
  name = "ll-network"
}

resource "azurerm_virtual_network" "ll-virt-network" {
  address_space = ["10.0.0.0/16"]
  location = "East US"
  name = "ll-virt-network"
  resource_group_name = "${azurerm_resource_group.ll-network.name}"
  dns_servers = ["10.0.0.4", "10.0.0.5"]
  subnet {
    name = "subnet1"
	address_prefix="10.0.1.0/24"
  }

  subnet {
    name = "subnet2"
	address_prefix="10.0.2.0/24"
  }
}
