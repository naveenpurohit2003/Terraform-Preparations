terraform {
  backend "s3" {
    bucket = "mys3buck181093dfdf2"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}