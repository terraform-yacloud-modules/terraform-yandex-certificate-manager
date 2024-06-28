# Yandex Cloud Certificate Manager Terraform module

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

In this example the self-managed certificates are created via the following command:
```bash
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj /CN=domain.com
 ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.47.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_self_managed"></a> [self\_managed](#module\_self\_managed) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_ids"></a> [certificate\_ids](#output\_certificate\_ids) | The IDs of the self-managed certificates. |
| <a name="output_certificate_issuer"></a> [certificate\_issuer](#output\_certificate\_issuer) | Issuer of the self-managed certificates. |
| <a name="output_certificate_not_after"></a> [certificate\_not\_after](#output\_certificate\_not\_after) | Self-managed certificate end valid period. |
| <a name="output_certificate_not_before"></a> [certificate\_not\_before](#output\_certificate\_not\_before) | Self-managed certificate start valid period. |
| <a name="output_certificate_status"></a> [certificate\_status](#output\_certificate\_status) | Status of the self-managed certificates. |
| <a name="output_certificate_subject"></a> [certificate\_subject](#output\_certificate\_subject) | Subject of the self-managed certificates. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
