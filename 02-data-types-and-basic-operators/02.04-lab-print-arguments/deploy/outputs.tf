output "Workspace_for_lab" {
  value       =  "${format("%s%s","https://",azurerm_dns_a_record.a_record.fqdn)}"
  description = "Workspace for lab"
  depends_on  = []
}

output "learn_rg" {
  value       =  azurerm_resource_group.learn.name
  description = "Resource group"
  depends_on  = []
}

output "container_group" {
  value       =  azurerm_container_group.containergroup.name
  description = "azurerm_container_group"
  depends_on  = []
}

output "instance_id" {
  value       =  ${var.instance_id}
  description = "instance_id"
  depends_on  = []
}
