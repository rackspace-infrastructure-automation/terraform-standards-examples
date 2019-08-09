variable "app_name" {
  description = "The name of the application, e.g. Magento, Wordpress, CustomerName, etc."
  type        = "string"
}

variable "aws_account_id" {
  description = "The account ID you are building into."
  type        = "string"
}

variable "cidr_range" {
  description = "VPC CIDR range."
  type        = "string"
}

variable "environment" {
  description = "The name of the environment, e.g. Production, Development, etc."
  type        = "string"
}

variable "private_cidr_ranges" {
  description = "List of private CIDRs to be used."
  type        = "list"
}

variable "public_cidr_ranges" {
  description = "List of public CIDRs to be used."
  type        = "list"
}

variable "region" {
  description = "The AWS region the state should reside in."
  type        = "string"
}
