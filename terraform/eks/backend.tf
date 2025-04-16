terraform {
  backend "s3" {
    bucket         = "harsha-terraform-backend-forstatelock"
    key            = "eks/dev/terraform.tfstate" 
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
