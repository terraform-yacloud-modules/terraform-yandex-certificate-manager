output "id" {
  description = "Lockbox secret ID"
  value       = module.testsecret.id
}

output "name" {
  description = "Lockbox secret name"
  value       = module.testsecret.name
}

output "self_managed_certificate_ids" {
  description = "The IDs of the self-managed certificates."
  value       = module.self_managed.self_managed_certificate_ids
}

output "self_managed_certificate_status" {
  description = "Status of the self-managed certificates."
  value       = module.self_managed.self_managed_certificate_status
}

output "self_managed_certificate_issuer" {
  description = "Issuer of the self-managed certificates."
  value       = module.self_managed.self_managed_certificate_issuer
}

output "self_managed_certificate_subject" {
  description = "Subject of the self-managed certificates."
  value       = module.self_managed.self_managed_certificate_subject
}

output "self_managed_certificate_not_before" {
  description = "Self-managed certificate start valid period."
  value       = module.self_managed.self_managed_certificate_not_before
}

output "self_managed_certificate_not_after" {
  description = "Self-managed certificate end valid period."
  value       = module.self_managed.self_managed_certificate_not_after
}
