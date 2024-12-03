required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "4.6.0"
  }
}

provider "azurerm" "this" {
  config {
    features {}
    tenant_id       = "f8667506-a537-4c81-842a-41fd0e547e43"
    subscription_id = var.subscription_id
    use_cli         = false
    use_oidc        = true
    oidc_token      = var.identity_token
    client_id       = var.client_id
  }
}

component "network" {
  source  = "app.terraform.io/Natilik-Showcase/vnet/azurerm"
  version = "2.0.2"
  inputs = {
    location      = var.location
    environment   = var.environment
    vnet_name     = var.vnet_name
    vnet_prefix   = var.vnet_prefix
    subnet_name   = var.subnet_name
    subnet_prefix = var.subnet_prefix
  }
  providers = {
    azurerm = provider.azurerm.this
  }
}

component "vm" {
  source  = "app.terraform.io/Natilik-Showcase/vm/azurerm"
  version = "2.0.1"
  inputs = {
    location    = var.location
    environment = var.environment
    subnet_id   = component.network.subnet_id
    vm_name     = var.vm_name
    vm_username = var.vm_username
    vm_password = var.vm_password
  }
  providers = {
    azurerm = provider.azurerm.this
  }
}
