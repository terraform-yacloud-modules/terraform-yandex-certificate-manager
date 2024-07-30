resource "yandex_cm_certificate" "self_managed" {
  for_each = var.self_managed

  name        = each.key
  description = each.value.description

  self_managed {
    certificate = each.value.certificate
    private_key = try(each.value.private_key, null)

    dynamic "private_key_lockbox_secret" {
      for_each = each.value.private_key == null ? [1] : []
      content {
        id  = try(each.value.private_key_lockbox_secret.id, null)
        key = try(each.value.private_key_lockbox_secret.key, null)
      }
    }
  }

  labels = each.value.labels
}

resource "yandex_cm_certificate" "managed" {
  for_each = var.managed

  name        = each.key
  domains     = each.value.domains
  description = each.value.description

  managed {
    challenge_type  = each.value.challenge_type
    challenge_count = each.value.challenge_count
  }

  labels = each.value.labels
}
