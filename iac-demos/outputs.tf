output "instance_public_ip" {
  description = "PUBLIC IP SHOWS HERE"
  value = aws_instance.web.public_ip
}
output "instance_public_dns" {
  description = "PUBLIC DNS SHOWS HERE"
  value = aws_instance.web.public_dns
}
output "vpc_id" {
  description = "VPC IDS"
  value = aws_vpc.vpc.id
}