output "secret_arn" {
  description = "ARN of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret.this.arn
}

output "secret_id" {
  description = "ID of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret.this.id
}
