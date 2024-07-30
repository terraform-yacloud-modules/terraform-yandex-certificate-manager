# Yandex Cloud Certificate Manager Terraform module

Terraform module which creates Yandex Cloud [Certificate Manager](https://yandex.cloud/en/docs/certificate-manager/) resources.

## Usage

See [examples](https://github.com/terraform-yacloud-modules/terraform-yandex-certificate-manager/tree/main/examples) directory for working examples.

### Self-managed certificate

Import into Certificate Manager a self-managed certificate.

```hcl
module "certificate_manager" {
  source = "terraform-yacloud-modules/certificate-manager/yandex"

  self_managed = {
    implicit = {
      description = "self-managed domain certificate"
      certificate = "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- \n -----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----"
      private_key = "-----BEGIN RSA PRIVATE KEY----- ... -----END RSA PRIVATE KEY-----"
    }
    file = {
      description = "self-managed domain certificate from file"
      certificate = file("cert.pem")
      private_key = file("key.pem")
    }
    lockbox = {
      description = "self-managed domain certificate from lockbox"
      certificate = "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- \n -----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----"
      private_key_lockbox_secret = {
        id  = "lockbox_id"
        key = "lockbox_key"
      }
    }
  }
  
  
}
```

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Self-managed certificate](https://github.com/terraform-yacloud-modules/terraform-yandex-certificate-manager/tree/main/examples/self-managed)
- [Managed certificate](https://github.com/terraform-yacloud-modules/terraform-yandex-certificate-manager/tree/main/examples/managed)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_cm_certificate.managed](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cm_certificate) | resource |
| [yandex_cm_certificate.self_managed](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_managed"></a> [managed](#input\_managed) | Managed certificate specification. | <pre>map(object({<br>    domains         = optional(list(string), [])    # List of domains for this certificate<br>    description     = optional(string, "")          # Certificate description.<br>    labels          = optional(map(string), {})     # Labels to assign to this certificate.<br>    challenge_type  = optional(string, "DNS_CNAME") # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP<br>    challenge_count = optional(number, 1)           # Expected number of challenge count needed to validate certificate.<br>    folder_id       = optional(string, null)        # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.<br>  }))</pre> | `{}` | no |
| <a name="input_self_managed"></a> [self\_managed](#input\_self\_managed) | Self-managed certificate specification. | <pre>map(object({<br>    description                = optional(string, "")                                  # Certificate description.<br>    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.<br>    certificate                = optional(string, null)                                # Certificate with chain.<br>    private_key                = optional(string, null)                                # Private key of certificate.<br>    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.<br>    folder_id                  = optional(string, null)                                # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_certificates"></a> [managed\_certificates](#output\_managed\_certificates) | Managed certificates grouped by domain. |
| <a name="output_self_managed_certificates"></a> [self\_managed\_certificates](#output\_self\_managed\_certificates) | Self-managed certificates grouped by domain. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
