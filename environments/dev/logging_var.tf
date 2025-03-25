variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "enable_flow_logs" {
  description = "Enable VPC flow logs"
  type        = bool
  default     = true
}

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