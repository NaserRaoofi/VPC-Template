variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

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