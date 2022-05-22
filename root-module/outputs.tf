# 
#       OUTPUTS
#

output "region" {
    value = var.region
    description = "Region"
}

output "vpc_id" {
  value       = aws_vpc.myVPC.id
  description = "The main VPC id"
}

output "private_ip" {
    value = aws_instance.ansible-slave.private_ip
    description = "Private ip"
}

output "public_ip" {
    value = aws_instance.ansible-slave.public_ip
    description = "Public ip"
}

