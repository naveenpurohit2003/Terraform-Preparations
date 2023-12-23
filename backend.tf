terraform {
  backend "s3" {
    bucket = "mys3buck181093dfdf2"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    
  }
}

resource "aws_dynamodb_table" "s3_bucket" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S" #String
    }
  
}