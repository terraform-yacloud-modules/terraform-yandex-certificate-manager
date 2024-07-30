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
output "self_managed_certificates" {
  description = "Self-managed certificates grouped by domain."
  value = {
    for domain, cert in yandex_cm_certificate.self_managed : domain => {
      challenges = cert.challenges
      created_at = cert.created_at
      deletion_protection = cert.deletion_protection
      description = cert.description
      id = cert.id
      issued_at = cert.issued_at
      issuer = cert.issuer
      labels = cert.labels
      name = cert.name
      not_after = cert.not_after
      not_before = cert.not_before
      serial = cert.serial
      status = cert.status
      subject = cert.subject
      type = cert.type
      updated_at = cert.updated_at
    }
  }
}
