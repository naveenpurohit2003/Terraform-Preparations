output "public_ip" {
  description = "Outputs the value of IP Address from a newly created EC2"
  value       = aws_instance.myfirstEC2.public_ip

}

output "private_ip" {
    description = "Private IP address from First EC2"
    value = aws_instance.myfirstEC2.private_ip
  
}


output "ami_id_ubuntu_east" {
  value = data.aws_ami.ubuntu.id
}

output "ami_id_ubuntu_west"{
    value = data.aws_ami.ubuntuwest.id
}

output "ami_id_rhel" {
  value = data.aws_ami.myaws_ami.id
  
}

output "public_ip2" {
    description = "Output EC2 Public IP"
    value = aws_instance.SecondEC2.public_ip
  
}

output "private_ip2" {
    description = "Outputs EC2 private IP"
    value = aws_instance.SecondEC2.private_ip
  
}

output "publicip3" {
    value = aws_instance.myec2west.public_ip
  
}

output "privateip3" {
    value = aws_instance.myec2west.private_ip
  
}

output "vpc1id" {
    value = aws_vpc.myfirstvpc.id
}

output "vpc2id" {
    value = aws_vpc.myvpc.id
}

output "vpc3id"{
    value = aws_vpc.private_vpc.id
}