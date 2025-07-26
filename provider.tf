terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "package-vul-scan-vrushali.tfstate"
    region = "ap-southeast-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}