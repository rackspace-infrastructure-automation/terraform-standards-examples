/**
 * # Layer/Module Title
 *
 * An example of a Terraform layer.
 *
 * ## Default Resources
 *
 * Call out any default settings
 */

terraform {
  backend "s3" {
    acl     = "private"
    encrypt = true
    key     = "999example.tfstate"
  }

  required_version = "0.11.8"
}

provider "aws" {
  version = "~> 1.61"

  allowed_account_ids = ["${var.aws_account_id}"]
  region              = "${var.region}"
}
