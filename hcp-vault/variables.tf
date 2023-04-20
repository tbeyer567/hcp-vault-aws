variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

variable "primary_cluster_hvn" {
  description = "The ID of the HCP HVN."
  type        = string
}

variable "primary_cluster_hvn_cidr" {
  description = "The CIDR range of the HCP HVN."
  type        = string
}

variable "primary_region" {
  description = "The region of the primary cluster HCP HVN and Vault cluster."
  type        = string
}

variable "secondary_cluster_hvn" {
  description = "The ID of the HCP HVN."
  type        = string
}

variable "secondary_cluster_hvn_cidr" {
  description = "The CIDR range of the HCP HVN."
  type        = string
}

variable "secondary_region" {
  description = "The region of the secondary cluster HCP HVN and Vault cluster."
  type        = string
}

variable "primary_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
}

variable "secondary_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
}

variable "tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "plus_small"
}