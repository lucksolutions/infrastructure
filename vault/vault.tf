provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "consul" {
  source = "github.com/hashicorp/consul/terraform/aws"

  key_name = "${var.aws_ssh_key_id}"
  key_path = "${var.aws_ssh_private_key}"
  region   = "${var.aws_region}"
  servers  = "3"
}

resource "aws_instance" "vault" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.vault.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}