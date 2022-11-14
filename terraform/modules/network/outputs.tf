output "vpc_1_id" {
  value       = aws_vpc.vpc_1.id
  description = "ID of the AWS VPC."
}

output "subnet_1_id" {
  value       = aws_subnet.subnet_1.id
  description = "ID of the AWS subnet."
}
