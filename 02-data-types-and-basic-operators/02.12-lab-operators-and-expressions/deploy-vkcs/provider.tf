terraform {
  required_providers {
    vkcs = {
      source = "vk-cs/vkcs"
    }
  }
}

provider "vkcs" {
  username   = "your username here"
  password   = "your password here"
  project_id = "your id here"
  region     = "RegionOne"
}

provider "azurerm" {
  features {}
}