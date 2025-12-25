variable "cluster_name" {
  type = string
}
variable "env" {
  description = "Environment name"
  type        = string
}
variable "region" {
  description = "AWS region"
  type        = string
}
variable "kubernetes_version" {
  type = string
}

variable "node_instance_types" {
  type = list(string)
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "tags" {
  type = map(string)
}

