terraform {
  backend "s3" {
    bucket = var.backend_bucket
    key    = "terraform/${var.environment}.tfstate"
    region = var.aws_region
    encrypt = true
  }
}
