##For specific resource outputs, check the end of the resource's .tf file

output "state_import_example" {
  description = "An example to use this layers state in another."

  value = <<EOF


  data "terraform_remote_state" "100data" {
    backend = "s3"

    config = {
      bucket = "${data.terraform_remote_state.main_state.state_bucket_id}"
      key = "terraform.${lower(var.environment)}.100data.tfstate"
      region = "${data.terraform_remote_state.main_state.state_bucket_region}"
      encrypt = "true"
    }
  }
EOF
}
