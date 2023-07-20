terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "ctf_instance" {
  name              = var.ctfdName
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "${var.size[var.userQty]}_2_0"
  user_data         = templatefile("${path.module}/init.sh", {
    s3key = var.s3_keyid,
    s3secret = var.s3_secret
    questionbank = var.questionbank
    importFile = var.importFile[var.questionbank]
  })
  tags = {
    owner = var.owner
    ttl = var.ttl
    customer = var.customer
    requester = var.requester
  }
}

# resource "aws_lightsail_domain" "ctf" {
#   domain_name = "cnapp.biz"
# }

resource "aws_lightsail_domain_entry" "test" {
  domain_name = "cnapp.biz"
  name        = var.ctfdName
  type        = "A"
  target      = aws_lightsail_instance.ctf_instance.public_ip_address
}
