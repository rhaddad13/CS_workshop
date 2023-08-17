terraform {
  backend "local" {
  }
  required_version = ">=0.13"
}

provider "aws" {
  # profile = "my_aws_creds"
  region = "eu-west-2"
}
#########################################################
# S3 Bucket
#########################################################
resource "aws_s3_bucket" "jdlab_ps_workshop_s3_001" {
  bucket = "rh-workshop-s3-001-20230816"

  tags = {
    "Name"      = "rh-ps-workshop-s3-001-20230816"
    "Terraform" = "true"
  }
}

resource "aws_s3_bucket_versioning" "rh_ps_workshop_s3_001_versioning" 
{
  bucket = aws_s3_bucket.rh_ps_workshop_s3_001.id
  versioning_configuration {
    status = "Disabled"
  }
}
