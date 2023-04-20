
resource "hcp_vault_cluster" "primary_cluster" {
  hvn_id          = hcp_hvn.primary_cluster_hvn.hvn_id
  cluster_id      = var.primary_cluster_id
  tier            = var.tier
  public_endpoint = false
}


resource "hcp_vault_cluster" "secondary_cluster" {
  hvn_id          = hcp_hvn.secondary_cluster_hvn.hvn_id
  cluster_id      = var.secondary_cluster_id
  tier            = var.tier
  primary_link    = hcp_vault_cluster.primary_cluster.self_link
  public_endpoint = false
}