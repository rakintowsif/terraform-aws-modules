variable "project_name" {
  description = "Project name used for resource naming prefix."
  type        = string
  default     = "terraform-aws-modules"
}

variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "List of AZs used for subnets. If empty, first three AZs are selected."
  type        = list(string)
  default     = []
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH into EC2."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ec2_key_name" {
  description = "Optional EC2 key pair name for SSH access."
  type        = string
  default     = ""
}

variable "public_instance_type" {
  description = "EC2 instance type for the public instance."
  type        = string
  default     = "t3.micro"
}

variable "private_instance_type" {
  description = "EC2 instance type for the private instance."
  type        = string
  default     = "t3.micro"
}

variable "db_name" {
  description = "Database name for the RDS instance."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "RDS master username."
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "RDS master password."
  type        = string
  sensitive   = true
}

variable "db_engine_version" {
  description = "PostgreSQL engine version."
  type        = string
  default     = "15.4"
}

variable "db_instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Storage size in GB for RDS."
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "Storage type for RDS."
  type        = string
  default     = "gp2"
}

variable "app_bucket_name" {
  description = "Name of the application S3 bucket."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all created resources."
  type        = map(string)
  default     = {}
}

variable "backend_bucket" {
  description = "S3 bucket for Terraform state backend."
  type        = string
}

variable "backend_key" {
  description = "S3 key for Terraform state file."
  type        = string
  default     = "terraform.tfstate"
}

variable "backend_region" {
  description = "Region of the Terraform backend S3 bucket."
  type        = string
  default     = "us-east-1"
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for Terraform state locking."
  type        = string
}
