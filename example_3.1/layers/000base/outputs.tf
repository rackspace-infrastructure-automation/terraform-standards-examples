output "nat_gateway_eip" {
  description = "The NAT gateway EIP(s) of the Base Network."
  value       = "${module.base_network.nat_gateway_eip}"
}

output "private_route_tables" {
  description = "The private route tables of the Base Network."
  value       = "${module.base_network.private_route_tables}"
}

output "private_subnets" {
  description = "The private subnets of the Base Network."
  value       = "${module.base_network.private_subnets}"
}

output "public_route_tables" {
  description = "The public route tables of the Base Network."
  value       = "${module.base_network.public_route_tables}"
}

output "public_subnets" {
  description = "The public subnets of the Base Network."
  value       = "${module.base_network.public_subnets}"
}

output "r53_internal_name" {
  description = "Hosted Zone Name"
  value       = "${module.internal_zone.internal_hosted_name}"
}

output "r53_internal_zone" {
  description = "Internal Route53 Zone ID."
  value       = "${module.internal_zone.internal_hosted_zone_id}"
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic."
  value       = "${module.sns_topic.topic_arn}"
}

output "sns_topic_id" {
  description = "The ID of the SNS topic."
  value       = "${module.sns_topic.topic_id}"
}

output "ssm_service_roles" {
  description = "All details about created SSM Service Roles."
  value       = "${module.ssm_service_roles.module_details}"
}

output "state_import_example" {
  description = "An example to use this layers state in another."

  value = <<EOF


  data "terraform_remote_state" "000base" {
    backend = "s3"

    config = {
      bucket = "${data.terraform_remote_state.main_state.state_bucket_id}"
      key = "terraform.${lower(var.environment)}.000base.tfstate"
      region = "${data.terraform_remote_state.main_state.state_bucket_region}"
      encrypt = "true"
    }
  }
EOF
}

output "vpc_id" {
  description = "The VPC ID of the Base Network."
  value       = "${module.base_network.vpc_id}"
}
