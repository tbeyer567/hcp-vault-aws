variable "primary_vpc_name" {
  type    = string
  default = "vault-us-west-2"
}

variable "secondary_vpc_name" {
  type    = string
  default = "vault-us-east-1"
}

variable "primary_vpc_cidr" {
  type    = string
  default = "10.32.0.0/22"
}

variable "secondary_vpc_cidr" {
  type    = string
  default = "10.32.4.0/22"
}

variable "primary_vpc_azs" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "secondary_vpc_azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "primary_vpc_subnets" {
  type    = list(string)
  default = ["10.32.0.0/25", "10.32.1.0/25", "10.32.2.0/25"]
}

variable "primary_public_subnets" {
  type    = list(string)
  default = ["10.32.0.128/25", "10.32.1.128/25", "10.32.2.128/25"]
}

variable "secondary_vpc_subnets" {
  type    = list(string)
  default = ["10.32.4.0/25", "10.32.5.0/25", "10.32.6.0/25"]
}

variable "secondary_public_subnets" {
  type    = list(string)
  default = ["10.32.4.128/25", "10.32.5.128/25", "10.32.6.128/25"]
}

variable "primary_hvn_cidr" {
  type    = string
  default = "172.24.8.0/24"
}

variable "secondary_hvn_cidr" {
  type    = string
  default = "172.24.9.0/24"
}