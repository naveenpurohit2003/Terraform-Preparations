provider "aws" {
    region = "us-west-2"
    alias = "west2"
  
}
resource "aws_vpc" "publicvpc" {
    cidr_block = "192.168.0.0/16"
    provider = aws.west2

  
}

resource "aws_subnet" "publicsubnet" {

    vpc_id = aws_vpc.publicvpc.id
    cidr_block = "192.168.1.0/24"
    map_public_ip_on_launch = true 
    provider = aws.west2
     
}

resource "aws_internet_gateway" "publicsubnetigw" {
    vpc_id = aws_vpc.publicvpc.id
    provider = aws.west2
  
}

data "aws_ami""publicamiID" {
    most_recent = true
    provider = aws.west2
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
    
  


resource "aws_instance" "publicsubnetEC2" {
    ami = data.aws_ami.publicamiID.id
    instance_type = "t3.micro"
    provider = aws.west2
    subnet_id = aws_subnet.publicsubnet.id
  
}


  
