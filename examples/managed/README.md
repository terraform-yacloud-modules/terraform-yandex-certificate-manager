# Managed example

## Usage
You need to register a domain, for example on reg.ru.

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

`folder_id` задаётся в `terraform.tfvars` (или передаётся как переменная `-var folder_id=...` / через Terragrunt `inputs`).

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.136.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.136.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_address"></a> [address](#module\_address) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-address.git | v1.46.0 |
| <a name="module_dns_letsencrypt"></a> [dns\_letsencrypt](#module\_dns\_letsencrypt) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset | v1.0.0 |
| <a name="module_dns_recordset"></a> [dns\_recordset](#module\_dns\_recordset) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset | v1.0.0 |
| <a name="module_dns_zone"></a> [dns\_zone](#module\_dns\_zone) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/zone | v1.0.0 |
| <a name="module_managed"></a> [managed](#module\_managed) | ../../ | n/a |
| <a name="module_network"></a> [network](#module\_network) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-vpc.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.certificate_consumer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID каталога Yandex Cloud, в котором создаются ресурсы. Имеет приоритет над YC\_FOLDER\_ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_consumer_service_account_id"></a> [certificate\_consumer\_service\_account\_id](#output\_certificate\_consumer\_service\_account\_id) | Service account ID used in the certificate IAM members and bindings. |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | n/a |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_dns_type"></a> [dns\_type](#output\_dns\_type) | n/a |
| <a name="output_dns_value"></a> [dns\_value](#output\_dns\_value) | n/a |
| <a name="output_domain"></a> [domain](#output\_domain) | n/a |
| <a name="output_external_ipv4"></a> [external\_ipv4](#output\_external\_ipv4) | External IPv4 address details |
| <a name="output_http_content"></a> [http\_content](#output\_http\_content) | n/a |
| <a name="output_http_url"></a> [http\_url](#output\_http\_url) | n/a |
| <a name="output_message"></a> [message](#output\_message) | n/a |
| <a name="output_test_certificate"></a> [test\_certificate](#output\_test\_certificate) | Certificate details for test |
| <a name="output_type"></a> [type](#output\_type) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The unique identifier of the DNS zone created by the module. |
<!-- END_TF_DOCS -->