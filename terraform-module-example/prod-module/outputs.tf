# 
#       OUTPUTS
#


output "region" {
    value = module.prod_corp.region
    description = "Region"
}

output "vpc_id" {
  value       = module.prod_corp.vpc_id
  description = "The main VPC id"
}

output "private_ip" {
    value = module.prod_corp.private_ip
    description = "Private ip"
}

output "public_ip" {
    value = module.prod_corp.public_ip
    description = "Public ip"
}