
resource "aws_vpc" "myfirstvpc" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.east
  enable_dns_hostnames = true

}

resource "aws_subnet" "myfirstec2subnet" {
  vpc_id = aws_vpc.myfirstvpc.id
  availability_zone = "us-east-1a"
  cidr_block = aws_vpc.myfirstvpc.cidr_block
  provider = aws.east
  
}

data "aws_ami" "ubuntu" {

  most_recent = true
  provider = aws.east

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230919"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "myfirstEC2" {
  tags = {
    name = "first instance"
  }
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.myfirstec2subnet.id
  provider = aws.east
}



# resource "aws_kms_key" "mykey" {
#   description             = "This key is used to encrypt bucket objects"
#   deletion_window_in_days = 10
#   provider = aws.east
# }

resource "aws_s3_bucket" "mys3bucket" {

  provider = aws.east
  bucket = "mys3buck181093dfdf2"

}

# resource "aws_s3_bucket_server_side_encryption_configuration" "mysseconf" {
#   bucket = aws_s3_bucket.mys3bucket.id
#   rule{
#     apply_server_side_encryption_by_default {
#       sse_algorithm     = "AES256"
#     }
#    }
