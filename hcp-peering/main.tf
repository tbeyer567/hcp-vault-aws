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

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.ingress_ssh_cidr_blocks
  description = "Allow SSH access in to VPC"
  
  security_group_id = var.security_group_id
}