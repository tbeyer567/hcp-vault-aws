resource "hcp_hvn" "primary_cluster_hvn" {
  hvn_id         = var.primary_cluster_hvn
  cloud_provider = var.cloud_provider
  region         = var.primary_region
  cidr_block     = var.primary_cluster_hvn_cidr
}

resource "hcp_hvn" "secondary_cluster_hvn" {
  hvn_id         = var.secondary_cluster_hvn
  cloud_provider = var.cloud_provider
  region         = var.secondary_region
  cidr_block     = var.secondary_cluster_hvn_cidr
}
