terraform {
  backend "s3" {
    bucket         = "urtechmitra-eks-state"        # CHANGE THIS to your bucket name
    region         = "us-east-1"
    key            = "reddit-app/terraform.tfstate"
    dynamodb_table = "urtechmitra-lock"             # CHANGE THIS to your table name
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
