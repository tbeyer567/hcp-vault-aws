resource "hcp_aws_network_peering" "main" {
  hvn_id          = var.hvn_id
  peering_id      = var.peering_id
  peer_vpc_id     = var.vpc_id
  peer_account_id = data.aws_caller_identity.current.account_id
  peer_vpc_region = var.region
}

resource "hcp_hvn_route" "main" {
  hvn_link         = data.hcp_hvn.main.self_link
  hvn_route_id     = var.route_id
  destination_cidr = data.aws_vpc.main.cidr_block
  target_link      = hcp_aws_network_peering.main.self_link
}

resource "aws_vpc_peering_connection_accepter" "main" {
  vpc_peering_connection_id = hcp_aws_network_peering.main.provider_peering_id
  auto_accept               = true
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  description = "Permit incoming SSH connections"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  security_group_id = var.security_group_id
}

resource "aws_vpc_security_group_egress_rule" "allow_egress" {
  description = "Permit egress traffic from VPC"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  security_group_id = var.security_group_id
}

resource "aws_vpc_security_group_egress_rule" "vault_api" {
  description = "allow access to HCP Vault API"
  ip_protocol = "tcp"
  to_port     = 8200
  from_port   = 8200
  cidr_ipv4   = var.hvn_cidr

  security_group_id = var.security_group_id
}