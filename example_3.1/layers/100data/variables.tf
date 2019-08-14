variable "app_name" {
  description = "The name of the application, e.g. Magento, Wordpress, CustomerName, etc."
  type        = "string"
}

variable "aws_account_id" {
  description = "The account ID you are building into."
  type        = "string"
}

variable "environment" {
  description = "The name of the environment, e.g. Production, Development, etc."
  type        = "string"
}

variable "region" {
  description = "The AWS region the resource should reside in."
  type        = "string"
}
