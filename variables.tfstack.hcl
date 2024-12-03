# variables.tfstack.hcl

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network (VNet)."
  type        = string
}

variable "vnet_prefix" {
  description = "The CIDR block for the Virtual Network (VNet)."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the Virtual Network."
  type        = string
}

variable "subnet_prefix" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string
}

variable "vm_username" {
  description = "The administrator username for the Virtual Machine."
  type        = string
}

variable "vm_password" {
  description = "The administrator password for the Virtual Machine."
  type        = string
}

variable "environment" {
  description = "The environment that the stack is being deployed to."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "identity_token" {
  description = "The OIDC token for the identity."
  ephemeral   = true
  type        = string
}

variable "client_id" {
  description = "The client ID for the identity."
  type        = string
}
