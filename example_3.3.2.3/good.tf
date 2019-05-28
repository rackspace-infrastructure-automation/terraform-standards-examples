resource "aws_cloudwatch_log_group" "apache_good" {
  count = "2"

  name              = "apache[${count.index + 1}]"
  retention_in_days = 15
}
