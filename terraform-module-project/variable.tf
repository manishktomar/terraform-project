variable "aws_region" {
  description = "AWS region to deploy infrastructure"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket for Terraform state"
}

variable "dynamodb_table" {
  description = "DynamoDB table for state locking"
}
