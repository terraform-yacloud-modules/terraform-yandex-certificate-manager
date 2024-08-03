data "yandex_client_config" "client" {}

module "network" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-vpc.git?ref=v1.0.0"

  folder_id  = data.yandex_client_config.client.folder_id
  blank_name = "instance-minimal-vpc-nat-gateway"

  azs = ["ru-central1-a"]

  private_subnets    = [["10.17.0.0/24"]]
  create_vpc         = true
  create_nat_gateway = true
}

module "yandex_compute_instance" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-instance.git?ref=v1.0.0"

  folder_id = data.yandex_client_config.client.folder_id

  name = "minimal-instance"

  zone       = "ru-central1-a"
  subnet_id  = module.network.private_subnets_ids[0]
  enable_nat = true
  create_pip = true

  hostname         = "minimal-instance"
  generate_ssh_key = false
  ssh_user         = "ubuntu"
  ssh_pubkey       = "~/.ssh/id_rsa.pub"

  user_data = <<-EOF
        #cloud-config
        package_upgrade: true
        packages:
          - nginx
        runcmd:
          - [systemctl, start, nginx]
          - [systemctl, enable, nginx]
        EOF
}

module "dns_zone" {

  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/zone?ref=v1.0.0"

  name        = "my-private-zone"

  zone             = "dns-zone.org.ru."
  is_public        = true
  private_networks = [module.network.vpc_id] # можете заменить на ваш network_id
}

module "dns_recordset" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset?ref=v1.0.0"

  zone_id = module.dns_zone.id
  name    = "test.dns-zone.org.ru."
  type    = "A"
  ttl     = 200
  data    = [module.yandex_compute_instance.instance_public_ip]
}

# module "dns_letsencrypt" {
#   source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset?ref=v1.0.0"
#
#   zone_id = module.dns_zone.id
#   name    = module.managed.managed_certificates["test"].challenges[0].dns_name
#   type    = module.managed.managed_certificates["test"].challenges[0].dns_value
#   ttl     = 200
#   data    = [module.managed.managed_certificates["test"].challenges[0].dns_value]
# }


module "managed" {
  source = "../../"

  managed = {
    test = {
      domains         = ["test.dns-zone.org.ru"]
      challenge_type  = "DNS_CNAME"
      challenge_count = 1
    }
  }
}
