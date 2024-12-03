# deployments.tfdeploy.hcl

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "cdd3432a-1699-48ed-b87a-7ff4ac04fc88"
    subscription_id = "ca8cc1e9-df12-4028-8697-50854c5a0923"
    location        = "uksouth"
    environment     = "dev"
    vnet_name       = "vnet-stacks-dev"
    vnet_prefix     = "10.1.0.0/16"
    subnet_name     = "snet-stacks-dev"
    subnet_prefix   = "10.1.1.0/24"
    vm_name         = "vm-stacks"
    vm_username     = "stacks"
    vm_password     = "Password1234!"
  }
}

deployment "stg" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "ad950591-e572-4582-91d5-15d625616367"
    subscription_id = "bc884483-24ef-40c5-b8d4-0c35a50ca8f8"
    location        = "uksouth"
    environment     = "stg"
    vnet_name       = "vnet-stacks-stg"
    vnet_prefix     = "10.2.0.0/16"
    subnet_name     = "snet-stacks-dev"
    subnet_prefix   = "10.2.1.0/24"
    vm_name         = "vm-stacks"
    vm_username     = "stacks"
    vm_password     = "Password1234!"
  }
}

deployment "prd" {
  inputs = {
    identity_token  = identity_token.azurerm.jwt
    client_id       = "20afe314-8577-4699-8dff-f2da82c5fd3a"
    subscription_id = "e98088f7-5cd3-4c77-8dc7-7468bacdd6a5"
    location        = "uksouth"
    environment     = "prd"
    vnet_name       = "vnet-stacks-prd"
    vnet_prefix     = "10.3.0.0/16"
    subnet_name     = "snet-stacks-prd"
    subnet_prefix   = "10.3.1.0/24"
    vm_name         = "vm-stacks"
    vm_username     = "stacks"
    vm_password     = "Password1234!"
  }
}

orchestrate "auto_approve" "dev_only" {
  check {
    condition = context.plan.deployment == deployment.dev
    reason    = "Plan is not targeting dev."
  }

  check {
    condition = context.plan.applyable
    reason    = "Changes are not applyable."
  }
}
