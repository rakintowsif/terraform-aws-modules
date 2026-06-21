# terraform-aws-modules

Reusable Terraform modules for AWS infrastructure.

## Included modules

- `modules/vpc` - VPC with 3 public subnets, 3 private subnets, 3 DB subnets, IGW, NAT gateway, and route tables.
- `modules/ec2` - EC2 instance module with security group and SSH support.
- `modules/rds` - PostgreSQL RDS instance with DB subnet group.
- `modules/s3` - S3 bucket module with encryption and versioning.
- `modules/secrets` - Secrets Manager secret module.

## Example deployment

Use the root module in this folder to deploy the full architecture with backend state in S3 and DynamoDB locks.

1. Create backend resources first:
   - S3 bucket for Terraform state
   - DynamoDB table for locking

2. Configure `terraform.tfvars` or environment variables:

```hcl
project_name        = "my-project"
aws_region          = "us-east-1"
app_bucket_name     = "my-project-app-bucket"
backend_bucket      = "my-terraform-state-bucket"
backend_dynamodb_table = "my-terraform-locks"
backend_key         = "terraform.tfstate"
backend_region      = "us-east-1"
db_password         = "YourSecurePassword123!"
```

3. Initialize and apply:

```bash
terraform init
terraform apply
```

## Module usage

### VPC module

```hcl
module "vpc" {
  source = "./modules/vpc"

  name               = "my-project"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  tags = {
    Environment = "dev"
  }
}
```

### EC2 module

```hcl
module "web" {
  source = "./modules/ec2"

  name                       = "my-project-web"
  vpc_id                     = module.vpc.vpc_id
  subnet_id                  = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = true
  key_name                   = "my-keypair"
}
```

### RDS module

```hcl
module "db" {
  source = "./modules/rds"

  name               = "my-project"
  subnet_ids         = module.vpc.db_subnet_ids
  security_group_ids = [aws_security_group.rds.id]
  username           = "postgres"
  password           = "mypassword"
}
```

### S3 bucket module

```hcl
module "bucket" {
  source      = "./modules/s3"
  bucket_name = "my-project-bucket"
}
```

### Secrets module

```hcl
module "db_secret" {
  source = "./modules/secrets"

  name = "my-project-rds-secret"
  secret_values = {
    username = "postgres"
    password = "mypassword"
  }
}
```

## Notes

- The root example creates one public EC2, one private EC2, one PostgreSQL RDS, one S3 bucket, and one Secrets Manager secret.
- Customize `terraform.tfvars` for each project that consumes these modules.
- The backend uses AWS S3 and DynamoDB lock table.

