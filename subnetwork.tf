resource "google_compute_subnetwork" "ll-subnet" {
  ip_cidr_range = "10.0.1.0/24"
  name = "ll-subnet"
  network = "${google_compute_network.ll-network.self_link}"
  region = "asia-south1"
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

