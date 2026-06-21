variable "name" {
  description = "Base name for the EC2 instance and related resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the instance will be created."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Optional AMI ID to use. If empty, the latest Amazon Linux 2 AMI is selected."
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access."
  type        = string
  default     = ""
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to access SSH on the instance."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "user_data" {
  description = "Optional user data script for EC2 initialization."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the EC2 instance and security group."
  type        = map(string)
  default     = {}
}
