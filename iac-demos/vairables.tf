variable "aws_region" {
    description = "AWS Region provided by user"
    type = string
  
}
variable "vpc_cidr" {
   
    type = string
    default = "10.0.0.0/16"
  
}
variable "subnet_cidr" {
   
    type = string
    default = "10.0.1.0/24"
  
}
variable "availability_zone" {
   
    type = string
    default = "us-east-1a"
  
}
variable "allowed_ssh_cidr" {
   
    type = string
    default = "0.0.0.0/0"
  
}
variable "ami_id" {
   
    type = string
    default = "ami-0c398cb65a93047f2"
  
}
variable "instance_type" {
   
    type = string
    default = "t2.micro"
  
}
variable "instance_name" {
   
    type = string
    default = "ubuntu-public-ec2"
  
}