output "vpc_id" {
  description = "ID of the deployed VPC."
  value       = module.vpc.vpc_id
}

output "public_instance_id" {
  description = "ID of the public EC2 instance."
  value       = module.public_ec2.instance_id
}

output "private_instance_id" {
  description = "ID of the private EC2 instance."
  value       = module.private_ec2.instance_id
}

output "rds_endpoint" {
  description = "Endpoint address for the RDS instance."
  value       = module.rds.db_instance_endpoint
}

output "s3_bucket_arn" {
  description = "ARN of the application S3 bucket."
  value       = module.app_bucket.bucket_arn
}

output "secret_arn" {
  description = "ARN of the RDS credentials secret."
  value       = module.db_secret.secret_arn
}
