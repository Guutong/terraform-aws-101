provider "aws" {
    profile = var.profile
    region = "ap-southeast-1"
}

variable "profile" {
    description =  "AWS Profile"
}

resource "aws_instance" "guutong_ec2" {
    ami = "ami-093da183b859d5a4b"
    instance_type = "t2.medium"
    tags = {
      Name = "guutong-tf"
    }
}


