variable "enable_flow_logs" {}
variable "flow_logs_retention_days" {}
variable "vpc_id" {}
variable "log_role_arn" {}
variable "environment" {}
variable "tags" {
  type = map(string)
}
