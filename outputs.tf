################################################################################
# Managed Certificate
################################################################################

output "managed_certificate_ids" {
  description = "The IDs of the managed certificates."
  value       = try(yandex_cm_certificate.managed[*].id, null)
}

output "managed_certificate_status" {
  description = "Status of the managed certificates."
  value       = try(yandex_cm_certificate.managed[*].status, null)
}

output "managed_certificate_issuer" {
  description = "Issuer of the managed certificates."
  value       = try(yandex_cm_certificate.managed[*].issuer, null)
}

output "managed_certificate_subject" {
  description = "Subject of the managed certificates."
  value       = try(yandex_cm_certificate.managed[*].subject, null)
}

output "managed_certificate_not_before" {
  description = "Managed certificate start valid period."
  value       = try(yandex_cm_certificate.managed[*].not_before, null)
}

output "managed_certificate_not_after" {
  description = "Managed certificate end valid period."
  value       = try(yandex_cm_certificate.managed[*].not_after, null)
}

################################################################################
# Self-Managed Certificate
################################################################################

output "self_managed_certificate_ids" {
  description = "The IDs of the self-managed certificates."
  value       = try(yandex_cm_certificate.self_managed[*].id, null)
}

output "self_managed_certificate_status" {
  description = "Status of the self-managed certificates."
  value       = try(yandex_cm_certificate.self_managed[*].status, null)
}

output "self_managed_certificate_issuer" {
  description = "Issuer of the self-managed certificates."
  value       = try(yandex_cm_certificate.self_managed[*].issuer, null)
}

output "self_managed_certificate_subject" {
  description = "Subject of the self-managed certificates."
  value       = try(yandex_cm_certificate.self_managed[*].subject, null)
}

output "self_managed_certificate_not_before" {
  description = "Self-managed certificate start valid period."
  value       = try(yandex_cm_certificate.self_managed[*].not_before, null)
}

output "self_managed_certificate_not_after" {
  description = "Self-managed certificate end valid period."
  value       = try(yandex_cm_certificate.self_managed[*].not_after, null)
}
