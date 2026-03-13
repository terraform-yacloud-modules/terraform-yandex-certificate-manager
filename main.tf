data "yandex_client_config" "client" {}

resource "yandex_cm_certificate" "self_managed" {
  for_each = var.self_managed

  folder_id = try(each.value.folder_id, data.yandex_client_config.client.folder_id)

  name        = each.key
  description = each.value.description

  self_managed {
    certificate = each.value.certificate
    private_key = try(each.value.private_key, null)

    dynamic "private_key_lockbox_secret" {
      for_each = each.value.private_key == null && each.value.private_key_lockbox_secret != null ? [1] : []
      content {
        id  = each.value.private_key_lockbox_secret.id
        key = each.value.private_key_lockbox_secret.key
      }
    }
  }

  labels              = each.value.labels
  deletion_protection = each.value.deletion_protection
}

resource "yandex_cm_certificate" "managed" {
  for_each = var.managed

  folder_id = try(each.value.folder_id, data.yandex_client_config.client.folder_id)

  name        = each.key
  domains     = each.value.domains
  description = each.value.description

  managed {
    challenge_type  = each.value.challenge_type
    challenge_count = each.value.challenge_count
  }

  labels              = each.value.labels
  deletion_protection = each.value.deletion_protection
}

################################################################################
# Certificate IAM members (provider >= 0.136.0)
################################################################################
resource "yandex_cm_certificate_iam_member" "this" {
  for_each = {
    for k, v in var.certificate_iam_members : k => v
    if(v.certificate_type == "self_managed" && contains(keys(var.self_managed), v.certificate_key)) ||
    (v.certificate_type == "managed" && contains(keys(var.managed), v.certificate_key))
  }

  certificate_id = each.value.certificate_type == "self_managed" ? yandex_cm_certificate.self_managed[each.value.certificate_key].id : yandex_cm_certificate.managed[each.value.certificate_key].id
  role           = each.value.role
  member         = each.value.member
}
