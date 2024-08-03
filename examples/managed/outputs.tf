output "test1_certificate" {
  description = "Certificate details for test1"
  value       = module.managed.managed_certificates["test1"]
}

output "test2_certificate" {
  description = "Certificate details for test2"
  value       = module.managed.managed_certificates["test2"]
}

output "test3_certificate" {
  description = "Certificate details for test3"
  value       = module.managed.managed_certificates["test3"]
}
