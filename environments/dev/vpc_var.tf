variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_tags" {
  description = "Tags to apply to VPC resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}