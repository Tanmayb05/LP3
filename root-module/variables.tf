# 
#       VARIABLES
#

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}

data "aws_availability_zones" "available" {

  # state = "available"
  # all_availability_zones = true

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}