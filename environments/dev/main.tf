provider "aws" {
  region = "eu-west-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
  tags        = var.vpc_tags
  azs         = local.azs
}

module "iam" {
  source           = "../../modules/iam"
  environment      = var.environment
  tags             = var.iam_tags
  enable_flow_logs = var.enable_flow_logs
}

module "logging" {
  source                   = "../../modules/logging"
  environment              = var.environment
  enable_flow_logs         = var.enable_flow_logs
  flow_logs_retention_days = var.flow_logs_retention_days
  vpc_id                   = module.vpc.vpc_id
  log_role_arn             = module.iam.flow_log_role_arn
  tags                     = var.logging_tags
}

module "private_subnets" {
  source      = "../../modules/subnets/private_subnets"
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = var.vpc_cidr
  azs         = local.azs
  environment = var.environment
  tags        = var.subnet_tags
}

module "public_subnets" {
  source      = "../../modules/subnets/public_subnets"
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = var.vpc_cidr
  azs         = local.azs
  environment = var.environment
  tags        = var.subnet_tags
}