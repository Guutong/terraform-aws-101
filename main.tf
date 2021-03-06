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
  count         = 1
  ami           = "ami-093da183b859d5a4b"
  instance_type = var.instance_type
  subnet_id     = "subnet-4182a637"
  key_name      = "guutong-ec2"
  user_data     = file("bootstrap.sh")

  tags = {
    Name = "guutong-tf"
  }
}


