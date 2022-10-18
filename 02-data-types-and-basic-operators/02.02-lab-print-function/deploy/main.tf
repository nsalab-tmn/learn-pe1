
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.73"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "learn" {
  name     = "rg-${var.tp_name}-${var.instance_id}"
  location = "eastus"
  tags     = {
    Environment: "${var.tp_learn_env}"
    Owner: "${var.tp_learn_user}"
  }
}

resource "random_string" "learn" {
  length           = 16
  special          = false
  min_lower        = 2
  min_numeric      = 2
  min_upper        = 2
  min_special      = 1
  override_special = "+-=%#^@"
}

resource "azuread_user" "learn" {
  user_principal_name = "${var.tp_name}-${var.instance_id}@nsalab.org"
  display_name        = "${var.tp_name}-${var.instance_id}"
  mail_nickname       = "${var.tp_name}-${var.instance_id}"
  password            = random_string.learn.result
}

resource "azurerm_role_assignment" "learn" {
  scope                = azurerm_resource_group.learn.id
  role_definition_name = "Contributor"
  principal_id         = azuread_user.learn.object_id
}

resource "azurerm_resource_group_policy_assignment" "allowed-location-assignment" {
  name                 = "allowed-location-${var.tp_name}-${var.instance_id}"
  resource_group_id    = azurerm_resource_group.learn.id
  policy_definition_id = azurerm_policy_definition.allowed-location-definition.id
}

resource "azurerm_resource_group_policy_assignment" "allowed-sku-assignment" {
  name                 = "sku-assignment-${var.tp_name}-${var.instance_id}"
  resource_group_id    = azurerm_resource_group.learn.id
  policy_definition_id = azurerm_policy_definition.allowed-sku-definition.id
}

resource "azurerm_container_group" "containergroup" {
  name     = "rg-${var.tp_name}-${var.instance_id}"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.learn.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  dns_name_label      = "${var.tp_name}-${var.instance_id}"

  ports {
      port     = 8443
      protocol = "TCP"
    }

  tags     = {
    Environment: "${var.tp_learn_env}"
    Owner: "${var.tp_learn_user}"
  }

  volume {
    name="share"
    empty_dir={}
  }

  container {
    name   = "blob-${var.instance_id}"
    image  = "${var.LAB_DEPLOY_IMAGE_BLOB}"
    cpu    = 1
    memory = 1

    environment_variables {
      STORAGE_CONTAINER="${var.STORAGE_CONTAINER}"
      LAB_DEPLOY_TEMPLATES_CS="${var.LAB_DEPLOY_TEMPLATES_CS}"
      STORAGE_ACCOUNT_NAME="${var.STORAGE_ACCOUNT_NAME}"
      LAB_TP_NAME="${var.tp_name}"
      LAB_DEPLOY_PATH="${var.LAB_DEPLOY_PATH}"
    }

    volume {
      name                 = "share"
      mount_path           = "/share"
    }
  }

  container {
    name   = "code-${var.instance_id}"
    image  = "${var.LAB_DEPLOY_IMAGE_VSCODE}"
    cpu    = 1
    memory = 1

    ports {
        port     = 8443
        protocol = "TCP"
      }

    environment_variables {
      DEFAULT_WORKSPACE="/code"
    }

    volume {
      name                 = "share"
      mount_path           = "/code"
    }
  }
}