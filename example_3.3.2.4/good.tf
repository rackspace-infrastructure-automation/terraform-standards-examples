
resource "aws_dynamodb_table" "table" {
  billing_mode     = "${var.enable_pay_per_request ? "PAY_PER_REQUEST" : "PROVISIONED" }"
  hash_key         = "${var.hash_key}"
  name             = "${var.table_name}"
  range_key        = "${var.range_key}"
  read_capacity    = "${var.enable_pay_per_request ? 0 : var.read_capacity_units}"
  stream_enabled   = "${var.stream_enabled}"
  stream_view_type = "${var.stream_enabled ? var.stream_view_type : "" }"
  write_capacity   = "${var.enable_pay_per_request ? 0 : var.write_capacity_units}"

  attribute              = "${var.attributes}"
  global_secondary_index = "${var.global_secondary_index_maps}"
  local_secondary_index  = "${var.local_secondary_index_maps}"

  point_in_time_recovery {
    enabled = "${var.point_in_time_recovery}"
  }

  server_side_encryption {
    enabled = "${var.table_encryption_cmk}"
  }

  tags = "${merge(
    local.tags,
    var.tags
  )}"
}
