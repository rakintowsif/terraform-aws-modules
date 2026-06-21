output "db_instance_id" {
  description = "The RDS DB instance identifier."
  value       = aws_db_instance.this.id
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance."
  value       = aws_db_instance.this.endpoint
}

output "db_subnet_group_name" {
  description = "The DB subnet group name."
  value       = aws_db_subnet_group.this.name
}
