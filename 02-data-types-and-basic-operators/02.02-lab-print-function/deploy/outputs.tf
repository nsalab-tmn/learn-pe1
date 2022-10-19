output "Workspace_for_lab" {
  value       =  "${format("%s%s%s","https://",azurerm_container_group.containergroup.fqdn,":8443")}"
  description = "Workspace for lab"
  depends_on  = []
}
