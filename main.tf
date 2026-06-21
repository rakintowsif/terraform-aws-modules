terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = var.backend_bucket
    key            = var.backend_key
    region         = var.backend_region
    dynamodb_table = var.backend_dynamodb_table
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  name               = var.project_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  create_nat_gateway = true
  tags               = var.tags
}

module "public_ec2" {
  source = "./modules/ec2"

  name                       = "${var.project_name}-public"
  vpc_id                     = module.vpc.vpc_id
  subnet_id                  = element(module.vpc.public_subnet_ids, 0)
  instance_type              = var.public_instance_type
  associate_public_ip_address = true
  key_name                   = var.ec2_key_name
  allowed_ssh_cidrs          = var.allowed_ssh_cidrs
  tags                       = var.tags
}

module "private_ec2" {
  source = "./modules/ec2"

  name                       = "${var.project_name}-private"
  vpc_id                     = module.vpc.vpc_id
  subnet_id                  = element(module.vpc.private_subnet_ids, 0)
  instance_type              = var.private_instance_type
  associate_public_ip_address = false
  key_name                   = var.ec2_key_name
  allowed_ssh_cidrs          = var.allowed_ssh_cidrs
  tags                       = var.tags
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "RDS security group allowing internal VPC access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = [module.vpc.vpc_cidr]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-rds-sg"
  })
}

module "db_secret" {
  source = "./modules/secrets"

  name = "${var.project_name}-rds-secret"
  secret_values = {
    username = var.db_username
    password = var.db_password
    engine   = "postgres"
    database = var.db_name
  }
  tags = var.tags
}

module "rds" {
  source = "./modules/rds"

  name               = var.project_name
  subnet_ids         = module.vpc.db_subnet_ids
  security_group_ids = [aws_security_group.rds.id]
  db_name            = var.db_name
  username           = var.db_username
  password           = var.db_password
  engine_version     = var.db_engine_version
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  storage_type       = var.db_storage_type
  publicly_accessible = false
  multi_az           = false
  backup_retention_period = 7
  tags               = var.tags
}

module "app_bucket" {
  source = "./modules/s3"

  bucket_name = var.app_bucket_name
  acl         = "private"
  versioning  = true
  tags        = var.tags
}
