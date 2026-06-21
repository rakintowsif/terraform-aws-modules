output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = [for key in sort(keys(aws_subnet.public)) : aws_subnet.public[key].id]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = [for key in sort(keys(aws_subnet.private)) : aws_subnet.private[key].id]
}

output "db_subnet_ids" {
  description = "IDs of the database subnets."
  value       = [for key in sort(keys(aws_subnet.db)) : aws_subnet.db[key].id]
}

output "internet_gateway_id" {
  description = "The internet gateway ID for the VPC."
  value       = aws_internet_gateway.this.id
}
