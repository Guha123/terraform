terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-bucket-1024"
    key            = "cloudfront-s3/terraform.tfstate"
    region         = "us-east-1"

  }
}

provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source = "./modules/s3"

  bucket_name                  = var.bucket_name
  cloudfront_distribution_arn  = module.cloudfront.distribution_arn
  tags                         = var.tags
}

module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_id                = module.s3_bucket.bucket_id
  bucket_regional_domain   = module.s3_bucket.bucket_regional_domain_name
  origin_access_control_id = module.s3_bucket.origin_access_control_id
  tags                     = var.tags
}
