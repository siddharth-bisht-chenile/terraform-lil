provider "google" {
	credentials = file("../gcp-account.json")
	project = "jenkinx-259505"
	region = "asia-south1-a"
}

provider "aws" {
	region = "ap-south-1"
}

provider "azurerm" {
	subscription_id = "${var.subscription_id}"
	client_id = "${var.client_id}"
	client_secret = "${var.client_secret}"
	tenant_id = "${var.tenant_id}"
}

variable subscription_id {}
variable client_id {}
variable client_secret {}
variable tenant_id {}
