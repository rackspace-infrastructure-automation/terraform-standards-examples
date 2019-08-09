output "remote_state_configuration_example" {
  value = <<EOF


  terraform {
    backend "s3" {
      # this key must be unique for each layer!
      bucket = "${aws_s3_bucket.state.id}"
      key    = "terraform.EXAMPLE.000base.tfstate"
      region = "${aws_s3_bucket.state.region}"
      encrypt = "true"
    }
  }
EOF

  description = "A suggested terraform block to put into the build layers"
}

output "state_bucket_id" {
  value       = "${aws_s3_bucket.state.id}"
  description = "The ID of the bucket to be used for state files."
}

output "state_bucket_region" {
  value       = "${aws_s3_bucket.state.region}"
  description = "The region the state bucket resides in."
}

output "state_import_example" {
  value = <<EOF


  data "terraform_remote_state" "main_state" {
    backend = "local"

    config = {
      path = "../../_main/terraform.tfstate"
    }
  }
EOF

  description = "An example to use this layers state in another."
}
