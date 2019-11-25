resource "google_compute_network" "ll-network" {
  name = "ll-networking"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "ll-subnet" {
  ip_cidr_range = "10.0.1.0/24"
  name = "ll-subnet"
  network = "${google_compute_network.ll-network.self_link}"
  region = "asia-south1"
}

resource "aws_vpc" "ll-network" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.ll-network.cidr_block,3,1)}"
  vpc_id = "${aws_vpc.ll-network.id}"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.ll-network.cidr_block,2,2)}"
  vpc_id = "${aws_vpc.ll-network.id}"
  availability_zone = "ap-south-1b"
}

resource "aws_security_group" "subnet-security" {
  vpc_id = "${aws_vpc.ll-network.id}"
  ingress {
    cidr_blocks = [
	  "${aws_vpc.ll-network.cidr_block}"
	]
	from_port = 80
	to_port = 80
	protocol = "tcp"
  }
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