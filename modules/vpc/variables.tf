variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "Tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the VPC"
  type        = map(string)
  default     = {}
}
