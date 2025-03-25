# Global environment variable
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Tags to apply to VPC resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# IAM Configuration
variable "iam_tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "enable_flow_logs" {
  description = "Enable VPC flow logs"
  type        = bool
  default     = true
}

# Logging Configuration
variable "flow_logs_retention_days" {
  description = "Number of days to retain flow logs"
  type        = number
  default     = 30
}

variable "logging_tags" {
  description = "Tags to apply to logging resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# Subnet Configuration
variable "subnet_tags" {
  description = "Tags to apply to subnet resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
