terraform {
  backend "s3" {
    bucket         = "harsha-terraform-backend-forstatelock"
    key            = "ec2/dev/terraform.tfstate" 
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
