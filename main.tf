provider "aws" {
    profile = var.profile
    region = "ap-southeast-1"
}

resource "aws_instance" "guutong_ec2" {
    ami = "ami-093da183b859d5a4b"
    instance_type = var.instance_type
    tags = {
      Name = "guutong-tf"
    }
}


