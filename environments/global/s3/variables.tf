variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "Terraform state bucket name"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Terraform lock table name"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
