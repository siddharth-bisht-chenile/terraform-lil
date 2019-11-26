resource "google_compute_instance" "first-instance" {
  name = "first-instance"
  machine_type = "n1-standard-1"
  zone = "asia-south1-a"
  
  boot_disk {
    initialize_params {
	  image = "ubuntu-os-cloud/ubuntu-1804-lts"
	}
  }
  
  network_interface {
    subnetwork = "${google_compute_subnetwork.ll-subnet.name}"
	
	access_config {
	}
  }
  
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
	values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
	values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" first-instance {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet1.id}"
}