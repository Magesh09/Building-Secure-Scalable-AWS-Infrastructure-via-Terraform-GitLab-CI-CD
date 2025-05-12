variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "backend_bucket" {
  description = "S3 bucket to store Terraform state"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}
