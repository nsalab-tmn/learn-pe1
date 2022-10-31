output "URL" {
  value       = "https://${azurerm_dns_a_record.a_record.name}.${azurerm_dns_a_record.a_record.zone_name}"
  description = "Main portal address"
  depends_on  = []
}

output "ipv4" {
  value       = ${vkcs_compute_instance.compute[0].access_ip_v4}
  description = "Ip of vm"
  depends_on  = []
}