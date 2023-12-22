# variable "ami_value" {
#     description = "subnet details"
#     type = string
#     default = 

# }

data "aws_ami" "myaws_ami" {
    most_recent = true
      filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
    
    filter {
      name = "name"
      values = ["RHEL-*"]
    }
  
}



resource "aws_vpc" "myvpc" {
    
  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

}

resource "aws_instance" "myec2west" {
    ami = data.aws_ami.myaws_ami.id
    instance_type = var.instance_type
    availability_zone = "us-west-2a"
    subnet_id = "subnet-00a6fcfc3d58c609b"
    
    

  
}

