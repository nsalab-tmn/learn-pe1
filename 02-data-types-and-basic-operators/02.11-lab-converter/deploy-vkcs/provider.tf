terraform {
  required_providers {
    vkcs = {
      source = "vk-cs/vkcs"
    }
  }
}

provider "vkcs" {
  username   = "dkasabova@nsalab.org"
  password   = "LiveF@st2709"
  project_id = "25106ddf1f324579b6b0f2507088dc32"
  region     = "RegionOne"
}

provider "azurerm" {
  features {}
}