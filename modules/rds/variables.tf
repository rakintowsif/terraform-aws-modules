variable "name" {
  description = "Base name for RDS resources."
  type        = string
}

variable "subnet_ids" {
  description = "List of DB subnet IDs for the subnet group."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups attached to the RDS instance."
  type        = list(string)
  default     = []
}

variable "engine_version" {
  description = "PostgreSQL engine version."
  type        = string
  default     = "15.4"
}

variable "instance_class" {
  description = "DB instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB."
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the DB instance."
  type        = string
  default     = "gp2"
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "appdb"
}

variable "username" {
  description = "Master username for the database."
  type        = string
  default     = "postgres"
}

variable "password" {
  description = "Master password for the database."
  type        = string
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible."
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Whether the DB instance uses Multi-AZ."
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention period in days."
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  description = "Whether to skip a final snapshot when the RDS instance is destroyed."
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "Name of the final DB snapshot when skip_final_snapshot is false."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the RDS instance."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for RDS resources."
  type        = map(string)
  default     = {}
}
