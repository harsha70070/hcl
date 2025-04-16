terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

########################
# S3 BUCKET FOR BACKEND
########################
resource "aws_s3_bucket" "tf_backend" {
  bucket = "harsha-terraform-backend-forstatelock"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "TerraformBackendBucket"
    Environment = "Production"
  }
}

#############################
# DYNAMODB TABLE FOR LOCKING
#############################
resource "aws_dynamodb_table" "tf_locks" {
  name           = "terraform-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "TerraformLockTable"
    Environment = "Production"
  }
}
