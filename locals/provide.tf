terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
}

# Configure the S3 backend for Terraform state management
terraform {
  backend "s3" {
    bucket = "remote-state-backend-tf"
    key    = "locals.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enables S3 native locking
  }
}