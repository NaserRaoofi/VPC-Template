variable "vpc_id" {}
variable "vpc_cidr" {}
variable "azs" {
  type        = list(string)
  description = "List of Availability Zones"
}
variable "environment" {}
variable "tags" {
  type    = map(string)
  default = {}
}
