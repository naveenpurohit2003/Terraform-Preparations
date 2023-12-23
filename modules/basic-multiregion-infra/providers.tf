terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}
provider "aws" { # This is Provider1
  alias  = "east"
  region = "us-east-1"
}

provider "aws" {
  alias = "west"
  region = "us-west-2"
  
}

provider "aws" {
    region = "us-west-2"
  
}

