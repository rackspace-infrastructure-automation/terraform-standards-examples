/**
 * # 200compute
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

  key_pair_prefix   = "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-${lower(var.environment)}"
  key_pair_internal = "${local.key_pair_prefix}-internal"
}

# terraform block cannot be interpolated; sample provided as output of _main
terraform {
  backend "s3" {
    # this key must be unique for each layer!
    key     = "terraform.development.200compute.tfstate"
    bucket  = "999999999999-build-state-bucket"
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

data "terraform_remote_state" "000base" {
  backend = "s3"

  config = {
    bucket  = "999999999999-build-state-bucket"
    key     = "terraform.development.000base.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}
