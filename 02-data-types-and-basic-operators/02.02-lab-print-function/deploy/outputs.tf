output "Workspace_for_lab" {
  value       =  "${format("%s%s","http://",azurerm_dns_a_record.a_record.fqdn)}"
  description = "Workspace for lab"
  depends_on  = []
}
