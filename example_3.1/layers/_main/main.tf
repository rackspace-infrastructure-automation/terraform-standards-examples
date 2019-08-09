/**
 * # Initialisation
 *
 * This layer is used to create a S3 bucket for remote state storage.
 *
 * ### Create
 *
 * Update the `terraform.tfvars` file to include your account ID and region. This is just for the state bucket and not for where you are deploying your code so you can choose to place the bucket in a location closer to you than the target for the build.
 *
 * - generate AWS temporary credentials (see FAWS Janus)
 * - update terraform.tfvars with your environent and region
 *
 * ```bash
 * $ terraform init
 * $ terraform apply -auto-approve
 * ```
 *
 * ### Destroy
 *
 * * generate AWS temporary credentials (see FAWS Janus)
 *
 * ```bash
 * $ terraform destroy
 * ```
 *
 * When prompted, check the plan and then respond in the affirmative.
 */

provider "aws" {
  region              = "${var.region}"
  version             = "~> 2.17"
  allowed_account_ids = ["${var.aws_account_id}"]
}

data "aws_caller_identity" "current" {}

locals {
  # Add additional tags in the below map
  tags = {
    ServiceProvider = "Rackspace"
  }
}

resource "aws_s3_bucket" "state" {
  bucket        = "${data.aws_caller_identity.current.account_id}-build-state-bucket"
  force_destroy = true

  tags = "${local.tags}"

  lifecycle_rule {
    id      = "Expire30"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }

    expiration {
      days = 30
    }
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
