terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

provider "aws" {
  alias  = "region_a"
  region = "us-east-2"  
}

provider "aws" {
  alias  = "region_b"
  region = "us-west-1"  
}
