variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_internet_gateway" {
  description = "Create Internet Gateway"
  type        = bool
  default     = true
}