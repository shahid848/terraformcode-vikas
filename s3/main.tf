terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.5.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-shahid-terraform-bucket-2025"

  # Private bucket (Recommended)
  acl = "private"

  versioning = {
    enabled = true
  }

  # Public access completely blocked
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
}
