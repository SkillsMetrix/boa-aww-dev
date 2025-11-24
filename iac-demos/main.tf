provider "aws" {
  region = var.aws_region
  
}
#------ VPC-----

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
}

#------ Subnet-----

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
}
#------ IG-----

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

}
#------  Route table----
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route{
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
   
}
#------- security group---
resource "aws_security_group" "ssh" {
  name = "allow-ssh"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  } 
  
  #---- EC2 Instance---

  resource "aws_instance" "web" {
      ami = var.ami_id
      instance_type = var.instance_type
      subnet_id = aws_subnet.subnet.id
      vpc_security_group_ids = [aws_security_group.ssh.id]

      associate_public_ip_address = true

      tags = {
        Name: var.instance_name
      }
  }
