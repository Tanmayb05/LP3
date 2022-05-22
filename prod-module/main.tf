provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key 
}

module "prod_corp" {
  
  source = "../root-module/"

}

# 
#   VARIABLES
#
variable "aws_access_key" {
}
variable "aws_secret_key" {
}