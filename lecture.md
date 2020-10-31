# AWS

## Service
- EC2
- RDS
- S3
- EBS
- LAMBDA


# Terraform

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
- A map Of
- List

**** required
```sh
brew install aws-cli
```

in file `main.tf`
### provider 
```
provider "aws" {
    region = "ap-southeast-1"
}
```


### resource 

```
resource "aws_instance" "guutong_ec2" {
    ami             = "ami-093da183b859d5a4b"
    instance_type   = "t2.micro"
}
```

### command 

### Init terraform ใช้เฉพาะ ครั้งแรก
```sh
terraform init
```

### terraform plan 
เอาไว้ใช้ plan ของ


```sh
terraform plan -out tfplan
```

เอาไว้ช่วยดู state ของการสร้างเครื่อง



```
terraform destroy
```
เอาไว้ destroy ของจาก state


### Variable
```
variable "profile" {
    description =  "AWS Profile"
}
or
variable "profile" {
    description =  "AWS Profile"
    default = "default"
}
```
use 
```
provider "aws" {
    profile = var.profile
    region = "ap-southeast-1"
}
```

use file tfvars
```
profile = "odds"
instance_type = "t2.medium"
```


cmd
```
terraform plan -out tfplan -var "profile=odds"
or
terraform plan -out tfplan -var-file=terraform.tfvars
```

*note*
```
secret.tfvars // add secret.tfvars to ignore file
terraform.tfvars
```

### Data

code
```
data "<service>" "<variable_name>" {
  filter { // <---- filter by tag name
    name = "tag:Name"
    values = ["<name>"]
  }
}
```

ex.
```
data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["permier-research-ap-southeast-1b"]
  }
}
```