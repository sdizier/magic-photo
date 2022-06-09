# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "dynamo_read_action_list" {
  description = "Read Actions for dynamoDB"
  type        = list(string)
  default = [
    "dynamodb:BatchGetItem",
    "dynamodb:GetItem",
    "dynamodb:Query",
    "dynamodb:Scan"
  ]
}
variable "dynamo_write_action_list" {
  description = "Write Actions for dynamoDB"
  type        = list(string)
  default = [
    "dynamodb:PutItem",
    "dynamodb:UpdateItem",
    "dynamodb:DeleteItem",
    "dynamodb:BatchWriteItem"
  ]
}

        # "Action" : var.dynamo_write_s3_read,