variable "billing_acct" {
  description = "Please provide billing account name"
  type        = string
}

variable "project_name" {
  description = "Please provide project name"
  type        = string
}

variable "vpc_name" {
  description = "Please provide VPC name to build a VPC"
  type        = string
}

variable "region" {
  description = "Please provide a region to build a VPC"
  type        = string
}

variable "zone" {
  description = "Please provide a zone to build a VPC"
  type        = string
}

variable "firewall_name" {
  description = "Please provide a firewall name to build a VPC"
  type        = string
}

variable "network_tags" {
  description = "Please provide a network tag name to build a VPC"
  type        = list(any)
}

variable "labels" {
  description = "Please provide LABELS to bulid a VPC"
  type        = map
}