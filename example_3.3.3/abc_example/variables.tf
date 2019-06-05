variable "aws_account_id" {
  description = "AWS Account ID being worked in"
  type        = "string"
}

variable "environment" {
  description = "Name of the environment such as Production, Staging, etc."
  type        = "string"
}

variable "layer" {
  description = "Name of the layer to propagate to resources."
  type        = "string"
}

variable "region" {
  description = "The region in which to build resources."
  type        = "string"
}
