variable "bucket_name" {
  description = "Name of the S3 bucket."
  type        = string
}

variable "acl" {
  description = "ACL for the S3 bucket."
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Whether versioning is enabled on the bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Whether to delete all objects when the bucket is destroyed."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the S3 bucket."
  type        = map(string)
  default     = {}
}
