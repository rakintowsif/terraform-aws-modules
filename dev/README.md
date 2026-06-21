# Dev environment

This folder contains the development environment deployment using the shared Terraform modules.

## How to use

1. Update `terraform.tfvars` with environment-specific values.
2. Ensure the S3 backend bucket and DynamoDB lock table exist.
3. Run:

```bash
terraform init
terraform apply
```

## Notes

- The backend state key is `dev/terraform.tfstate`.
- The deployment creates VPC, EC2 instances, RDS PostgreSQL, S3 bucket, and Secrets Manager secret.
