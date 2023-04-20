terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    hcp = {
      source = "hashicorp/hcp"
    }
  }
}

provider "aws" {
  alias = "us-west-2"

  region = "us-west-2"
}

provider "aws" {
  alias = "us-east-1"

  region = "us-east-1"
}