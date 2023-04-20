module "primary_us_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  providers = {
    aws = aws.us-west-2
  }

  name            = var.primary_vpc_name
  cidr            = var.primary_vpc_cidr
  azs             = var.primary_vpc_azs
  public_subnets  = var.primary_public_subnets
  private_subnets = var.primary_vpc_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}

module "secondary_us_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  providers = {
    aws = aws.us-east-1
  }

  name            = var.secondary_vpc_name
  cidr            = var.secondary_vpc_cidr
  azs             = var.secondary_vpc_azs
  public_subnets  = var.secondary_public_subnets
  private_subnets = var.secondary_vpc_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}