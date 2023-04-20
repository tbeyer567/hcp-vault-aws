This repo deploys tep VPC's in AWS, split across two regions, and two HCP Vault clusters with associated HVN's with peering back to the afore mentioned VPC's.

To do:
  - Add inbound security group rules for SSH
  - Add outbound security group rules for egress
  - Add outbound security group rules for Vault API access
  - Update VPC route tables to finish peering