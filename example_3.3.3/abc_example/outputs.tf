output "sg_alb_id" {
  description = "ID of the ALB security group."
  value       = "${aws_security_group.alb.id}"
}
