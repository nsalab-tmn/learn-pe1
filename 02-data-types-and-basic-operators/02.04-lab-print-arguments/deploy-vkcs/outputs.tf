output "URL" {
  value       = "https://${azurerm_dns_a_record.a_record.name}.${azurerm_dns_a_record.a_record.zone_name}"
  description = "Main portal address"
  depends_on  = []
}