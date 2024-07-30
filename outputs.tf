################################################################################
# Managed Certificate
################################################################################
output "managed_certificates" {
  description = "Managed certificates grouped by domain."
  value = {
    for domain, cert in yandex_cm_certificate.managed : domain => {
      challenges          = cert.challenges
      created_at          = cert.created_at
      deletion_protection = cert.deletion_protection
      description         = cert.description
      id                  = cert.id
      issued_at           = cert.issued_at
      issuer              = cert.issuer
      labels              = cert.labels
      name                = cert.name
      not_after           = cert.not_after
      not_before          = cert.not_before
      serial              = cert.serial
      status              = cert.status
      subject             = cert.subject
      type                = cert.type
      updated_at          = cert.updated_at
    }
  }
}

################################################################################
# Self-Managed Certificate
################################################################################
output "self_managed_certificates" {
  description = "Self-managed certificates grouped by domain."
  value = {
    for domain, cert in yandex_cm_certificate.self_managed : domain => {
      challenges          = cert.challenges
      created_at          = cert.created_at
      deletion_protection = cert.deletion_protection
      description         = cert.description
      id                  = cert.id
      issued_at           = cert.issued_at
      issuer              = cert.issuer
      labels              = cert.labels
      name                = cert.name
      not_after           = cert.not_after
      not_before          = cert.not_before
      serial              = cert.serial
      status              = cert.status
      subject             = cert.subject
      type                = cert.type
      updated_at          = cert.updated_at
    }
  }
}
