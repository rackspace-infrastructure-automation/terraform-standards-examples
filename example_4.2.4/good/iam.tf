provider "aws" {
  alias  = "primary"
  region = "us-east-2"
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
}

resource "aws_rds_global_cluster" "example" {
  provider = "aws.primary"

  global_cluster_identifier = "example"
}

module "aurora_master" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-aurora//?ref=v0.0.2"

  providers = {
    aws = "aws.primary"
  }

  subnets           = "${module.vpc.private_subnets}"
  security_groups   =  ["${module.vpc.default_sg}"]
  name              = "sample-aurora-master"
  engine            = "aurora"
  instance_class    = "db.t2.medium"
  storage_encrypted = true
  binlog_format     = "MIXED"
  password          = "${data.aws_kms_secrets.rds_credentials.plaintext["password"]}"
  global_cluster_identifier = "example"
}

module "aurora_secondary" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-aurora//?ref=v0.0.2"

  providers = {
    aws = "aws.secondary"
  }

  subnets           = "${module.vpc.private_subnets}"
  security_groups   =  ["${module.vpc.default_sg}"]
  name              = "sample-aurora-secondary"
  engine            = "aurora"
  instance_class    = "db.t2.medium"
  storage_encrypted = true
  binlog_format     = "MIXED"
  password          = "${data.aws_kms_secrets.rds_credentials.plaintext["password"]}"
  global_cluster_identifier = "example"
}
