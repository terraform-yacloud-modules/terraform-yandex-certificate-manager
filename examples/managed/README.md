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
