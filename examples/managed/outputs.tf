output "zone_id" {
  description = "The unique identifier of the DNS zone created by the module."
  value       = module.dns_zone.id
}

output "test_certificate" {
  description = "Certificate details for test"
  value       = module.managed.managed_certificates["test"]
}

output "dns_name" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].dns_name
}

output "dns_type" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].dns_type
}

output "dns_value" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].dns_value
}

output "created_at" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].created_at
}

output "domain" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].domain
}

output "http_content" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].http_content
}

output "http_url" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].http_url
}

output "message" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].message
}

output "type" {
  description = ""
  value       = module.managed.managed_certificates["test"].challenges[0].type
}

output "external_ipv4" {
  description = "External IPv4 address details"
  value       = module.address.external_ipv4_address
}
