# terraform {
#     required_providers{
#         aws = {
#             source = "hashicorp/aws"
#             version = "5.31.0"
#                     }
#     }
# }

# provider "aws" {
#     region = "us-west-2"
  
# }

# data "aws_ami" "ubuntu" {
#     most_recent = true
#     filter {
#       name = "name"
#       values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230919"]
#     }
# }


resource "aws_vpc" "private_vpc" {
    cidr_block = "192.168.0.0/16" 
    instance_tenancy = "default"
    provider = aws.east
    enable_dns_hostnames = true
}

data "aws_ami" "ubuntuwest" {

  most_recent = true
  provider = aws.east

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230919"]
  }

  owners = ["amazon"]
}

resource "aws_internet_gateway" "myvpcigw" {
    vpc_id = aws_vpc.private_vpc.id
    tags = {
      name = "myigw"
    }
    provider = aws.east
  
}

resource "aws_subnet" "myvpcsubnet" {
    vpc_id = aws_vpc.private_vpc.id
    availability_zone = "us-east-1a"
    cidr_block = "192.168.2.0/24"
    map_public_ip_on_launch = true
    provider = aws.east
  
}

resource "aws_route_table" "myvpc_routetable" {
    vpc_id = aws_vpc.private_vpc.id
    provider = aws.east

}


resource "aws_instance" "SecondEC2" {
    ami = data.aws_ami.ubuntuwest.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.myvpcsubnet.id
    tags = {
      name:"myec2-tagged"
    }
    provider = aws.east
}




