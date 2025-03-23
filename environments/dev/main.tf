provider "aws" {
  region = "us-west-2"
}

locals {
  default_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  environment = "dev"
  tags        = local.default_tags
}

module "iam" {
  source           = "../../modules/iam"
  environment      = "dev"
  tags             = local.default_tags
  enable_flow_logs = true
}

module "logging" {
  source                   = "../../modules/logging"
  environment              = "dev"
  enable_flow_logs         = true
  flow_logs_retention_days = 30
  vpc_id                   = module.vpc.vpc_id
  log_role_arn             = module.iam.flow_log_role_arn
  tags                     = local.default_tags
}
