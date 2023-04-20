variable "hvn_id" {
  type = string
}

variable "peering_id" {
  description = "The hcp-peer primary peering ID."
  type        = string
}

variable "region" {
  description = "The region of the primary cluster HCP HVN and Vault cluster."
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "route_id" {
  description = "The hcp-peering route id"
  type        = string
}
