resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  instance_tenancy     = var.instance_tenancy

  tags = merge(
    {
      Name        = "${var.environment}-vpc"
      Environment = var.environment
      Terraform   = "true"
    },
    var.tags
  )
}
