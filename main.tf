module "hcp-vault" {
  source         = "./hcp-vault"
  cloud_provider = "aws"
  tier           = "plus_small"

  primary_cluster_hvn      = "hvn-us-west-2"
  primary_region           = "us-west-2"
  primary_cluster_hvn_cidr = var.primary_hvn_cidr
  primary_cluster_id       = "vault-us-west-2"

  secondary_cluster_hvn      = "hvn-us-east-1"
  secondary_region           = "us-east-1"
  secondary_cluster_hvn_cidr = var.secondary_hvn_cidr
  secondary_cluster_id       = "vault-us-east-1"
}

module "hcp-peering-primary" {
  depends_on = [module.hcp-vault]
  source = "./hcp-peering"

  providers = {
    aws = aws.us-west-2
  }

  hvn_id     = module.hcp-vault.hvn_primary_id
  peering_id = "us-west-2-peering"
  region     = "us-west-2"
  route_id   = "us-west-2-hvn-route"
  vpc_id     = module.primary_us_vpc.vpc_id
  hvn_cidr   = var.primary_hvn_cidr

  security_group_id = module.primary_us_vpc.default_security_group_id
}

module "hcp-peering-secondary" {
  depends_on = [module.hcp-vault]
  source = "./hcp-peering"

  providers = {
    aws = aws.us-east-1
  }

  hvn_id     = module.hcp-vault.hvn_secondary_id
  peering_id = "us-east-1-peering"
  region     = "us-east-1"
  route_id   = "us-east-1-hvn-route"
  vpc_id     = module.secondary_us_vpc.vpc_id
  hvn_cidr   = var.secondary_hvn_cidr

  security_group_id = module.secondary_us_vpc.default_security_group_id
}
