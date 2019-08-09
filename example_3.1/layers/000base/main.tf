/**
 * # 000base
 */

# pinned provider versions

provider "random" {
  version = "~> 1.0"
}

provider "template" {
  version = "~> 1.0"
}

# default provider
provider "aws" {
  version             = "~> 2.17"
  region              = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

locals {
  tags = {
    Environment     = "${var.environment}"
    ServiceProvider = "Rackspace"
  }
}

# terraform block cannot be interpolated; sample provided as output of _main
terraform {
  backend "s3" {
    # this key must be unique for each layer!
    bucket  = "999999999999-build-state-bucket"
    key     = "terraform.development.000base.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}

data "terraform_remote_state" "main_state" {
  backend = "local"

  config = {
    path = "../../_main/terraform.tfstate"
  }
}

######## Base Network setup with VPC Endpoints ########

module "base_network" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.0.10"

  az_count            = "${length(var.private_cidr_ranges)}"
  cidr_range          = "${var.cidr_range}"
  custom_tags         = "${local.tags}"
  environment         = "${var.environment}"
  private_cidr_ranges = "${var.private_cidr_ranges}"
  public_cidr_ranges  = "${var.public_cidr_ranges}"
  vpc_name            = "${var.environment}-${var.app_name}-VPC"
}

module "vpc_endpoint" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint//?ref=v0.0.5"

  dynamo_db_endpoint_enable = true
  environment               = "${var.environment}"
  route_tables_ids_list     = "${concat(module.base_network.private_route_tables, module.base_network.public_route_tables)}"
  s3_endpoint_enable        = true
  security_group_ids_list   = ["${aws_security_group.vpc_endpoint_security_group.id}"]
  vpc_id                    = "${module.base_network.vpc_id}"
}

######## Route53 Internal Zone creation ########

module "internal_zone" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.3"

  custom_tags   = "${local.tags}"
  target_vpc_id = "${module.base_network.vpc_id}"
  zone_name     = "${lower(var.environment)}.local"
}

######## SNS Topic creation ########

module "sns_topic" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-sns//?ref=v0.0.2"

  topic_name = "${var.environment}-${var.app_name}-SNS-Topic"
}

######## Service Role Creation ########

module "ssm_service_roles" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-iam_resources//modules/ssm_service_roles?ref=v0.0.1"

  create_automation_role         = true
  create_maintenance_window_role = true
}
