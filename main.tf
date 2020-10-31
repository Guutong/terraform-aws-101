provider "aws" {
  profile = var.profile
  region  = "ap-southeast-1"
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["premier-research-ap-southeast-1b"]
  }
}

resource "aws_instance" "guutong_ec2" {
  ami           = "ami-093da183b859d5a4b"
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.selected.id
  tags = {
    Name = "guutong-tf"
  }
}


