variable "name" {
  description = "Secret name in AWS Secrets Manager."
  type        = string
}

variable "secret_values" {
  description = "Key-value pairs stored in the secret."
  type        = map(string)
}

variable "tags" {
  description = "Tags for the secret."
  type        = map(string)
  default     = {}
}
