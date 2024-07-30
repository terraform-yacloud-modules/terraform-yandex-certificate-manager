output "id" {
  description = "Lockbox secret ID"
  value       = module.testsecret.id
}

output "name" {
  description = "Lockbox secret name"
  value       = module.testsecret.name
}

output "domain_com_certificate" {
  description = "Certificate details for domain-com"
  value       = module.self_managed.self_managed_certificates["domain-com"]
}

output "example_com_certificate" {
  description = "Certificate details for example-com"
  value       = module.self_managed.self_managed_certificates["example-com"]
}
