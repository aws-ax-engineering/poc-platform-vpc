terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "amex-engineering"
    workspaces {
      prefix = "poc-platform-vpc-"
    }
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_assume_role}"
    session_name = "poc-platform-vpc"
  }

  default_tags {
    tags = {
      product  = "poc engineering platform"
      pipeline = "poc-platform-vpc"
    }
  }
}