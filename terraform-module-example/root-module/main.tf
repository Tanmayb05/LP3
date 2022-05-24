terraform {
  required_version = ">= 0.12.26"
}

# 
#       INSTANCES
#

resource "aws_instance" "ansible-slave" {

  ami                    = "ami-0e472ba40eb589f49"
  instance_type          = var.instance_type
  depends_on = [aws_internet_gateway.igw-myVPC]
  tags = {
      Name = "ansible-slave"
  }

}


# 
#       1. VPC
#

resource "aws_vpc" "myVPC" {

  cidr_block = "10.200.0.0/16"
  tags = {
      Name = "myVPC"
  }
}


#
#       2. INTERNET GATEWAY
#

resource "aws_internet_gateway" "igw-myVPC" {
  
  vpc_id            = aws_vpc.myVPC.id
  tags = {
    Name = "igw-myVPC"
  }
}

# 
#       4. SUBNETS
#

resource "aws_subnet" "subnet-myVPC" {

  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = "10.200.0.0/24"
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
      Name = "subnet-myVPC"
  }

}


# 
#       5. ROUTE TABLE
#

resource "aws_route_table" "rt-myVPC" {
  
  vpc_id = aws_vpc.myVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-myVPC.id
  }
  tags = {
    Name = "rt-myVPC"
  }

}

# 
#       6. ROUTE TABLE ASSOCIATION
#

resource "aws_route_table_association" "rt-subnet-association" {
  
  subnet_id      = aws_subnet.subnet-myVPC.id
  /* gateway_id     = aws_internet_gateway.igw-myVPC.id */
  route_table_id = aws_route_table.rt-myVPC.id

}

# 
#       SECURITY GROUPS
#


resource "aws_security_group" "instance" {

  vpc_id = aws_vpc.myVPC.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
   from_port    = 0
   to_port      = 0
   protocol     = "-1"
   cidr_blocks  = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "ansible-slave"
  }

}







