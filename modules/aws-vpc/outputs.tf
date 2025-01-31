output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = values(aws_subnet.private)[*].id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = values(aws_subnet.public)[*].id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
