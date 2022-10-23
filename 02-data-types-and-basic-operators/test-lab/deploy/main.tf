
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

resource "azurerm_dns_a_record" "a_record" {
  name                = "${random_string.learn.result}"
  zone_name           = "az.skillscloud.company"
  resource_group_name = "nsalab-prod"
  ttl                 = 300
  records             = [azurerm_container_group.containergroup.ip_address]
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
  name     = "${var.tp_name}-${var.instance_id}"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.learn.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  dns_name_label      = "${var.tp_name}-${var.instance_id}"
  restart_policy      = "Never"

  tags     = {
    Environment: "${var.tp_learn_env}"
    Owner: "${var.tp_learn_user}"
  }

  image_registry_credential {
    server = "${var.LAB_DEPLOY_CONTAINER_SERVER}"
    username = "${var.LAB_DEPLOY_CONTAINER_USERNAME}"
    password = "${var.LAB_DEPLOY_CONTAINER_PASSWORD}"
  }
  
  container {
    name   = "code-${var.instance_id}"
    image  = "labdeployacrtst.azurecr.io/code-server-test:latest"
    cpu    = 0.5
    memory = 1

    ports {
        port     = 443
        protocol = "TCP"
      }

    environment_variables = {
      DEFAULT_WORKSPACE="/code"
      PORT="443"
      PUID="0"
      PGID="0"
      lab_assessment_templates_cs="${var.lab_assessment_templates_cs}"
      storage_container_materials="${var.storage_container_materials}"
      lab_assessment_path="${var.lab_assessment_path}"
      lab_tp_name="${var.LAB_TP_NAME}"
      STORAGE_CONTAINER="${var.STORAGE_CONTAINER}"
      LAB_DEPLOY_TEMPLATES_CS="${var.LAB_DEPLOY_TEMPLATES_CS}"
      STORAGE_ACCOUNT_NAME="${var.STORAGE_ACCOUNT_NAME}"
      LAB_TP_NAME="${var.LAB_TP_NAME}"
      LAB_DEPLOY_PATH="deploy/solution"
      DST_FOLDER="/code"    }

    volume {
      name                 = "share"
      mount_path           = "/code"
      empty_dir = true
    }
  }
}