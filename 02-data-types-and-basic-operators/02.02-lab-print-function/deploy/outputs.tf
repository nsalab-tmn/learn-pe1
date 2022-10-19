output "Workspace_for_lab" {
  value       = azurerm_container_group.containergroup.fqdn
  description = "Workspace for lab"
  depends_on  = []
}
