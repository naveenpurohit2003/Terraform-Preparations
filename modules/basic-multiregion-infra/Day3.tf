# variable "ami_value" {
#     description = "subnet details"
#     type = string
#     default = 

# }

data "aws_ami" "myaws_ami" {
    most_recent = true
    provider = aws.east
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
  provider = aws.east

}

resource "aws_instance" "myec2west" {
    ami = data.aws_ami.myaws_ami.id
    instance_type = var.instance_type
    availability_zone = "us-east-1a"
    subnet_id = aws_subnet.myfirstec2subnet.id
    provider = aws.east
    
    

  
}

