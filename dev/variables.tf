variable "project_name" {
  description = "Project name used for resource naming prefix."
  type        = string
  default     = "terraform-aws-modules"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "List of AZs used for subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec2_key_name" {
  description = "EC2 key pair name for SSH access."
  type        = string
  default     = ""
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH into EC2 instances."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "public_instance_type" {
  description = "EC2 instance type for the public EC2 instance."
  type        = string
  default     = "t3.micro"
}

variable "private_instance_type" {
  description = "EC2 instance type for the private EC2 instance."
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
