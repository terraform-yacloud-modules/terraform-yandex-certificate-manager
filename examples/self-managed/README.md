# Self-managed example

## Usage

To run this example you need to execute:

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
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
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_self_managed"></a> [self\_managed](#module\_self\_managed) | ../../ | n/a |
| <a name="module_testsecret"></a> [testsecret](#module\_testsecret) | git::https://github.com/terraform-yacloud-modules/terraform-yandex-lockbox.git | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_com_certificate"></a> [domain\_com\_certificate](#output\_domain\_com\_certificate) | Certificate details for domain-com |
| <a name="output_example_com_certificate"></a> [example\_com\_certificate](#output\_example\_com\_certificate) | Certificate details for example-com |
| <a name="output_id"></a> [id](#output\_id) | Lockbox secret ID |
| <a name="output_name"></a> [name](#output\_name) | Lockbox secret name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
