variable "name" {
  description = "Base name for resources created by this VPC module."
  type        = string
  default     = "shared"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Optional availability zones to use for subnets. If empty, Terraform selects the first three available AZs."
  type        = list(string)
  default     = []
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT gateway for private subnet internet access."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all created resources."
  type        = map(string)
  default     = {}
}
