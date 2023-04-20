data "aws_caller_identity" "current" {}

data "hcp_hvn" "main" {
  hvn_id = var.hvn_id
}

data "aws_vpc" "main" {
  id = var.vpc_id
}