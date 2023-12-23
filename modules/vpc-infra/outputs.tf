output "public_ip_infra" {
    value = aws_instance.publicsubnetEC2.public_ip
  
}

output "private_ip_infra" {
    value = aws_instance.publicsubnetEC2.private_ip
    
}