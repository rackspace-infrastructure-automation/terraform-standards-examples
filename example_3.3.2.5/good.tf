resource "aws_db_subnet_group" "db_subnet_group" {
  count = "${var.create_subnet_group ? 1 : 0}"

  description = "Database subnet group for ${var.name}"
  name_prefix = "${var.name}-"
  subnet_ids  = ["${var.subnets}"]

  tags = "${merge(
    var.tags,
    local.tags
  )}"

  depends_on = [
    "aws_vpc.vpc"
  ]

  lifecycle {
    create_before_destroy = true
  }
}
