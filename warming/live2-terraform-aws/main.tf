terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}

# Create a VPC
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "tcb-app-qa-jordhanbucketnametest" 
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
    bucket = aws_s3_bucket.s3_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}