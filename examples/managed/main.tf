data "yandex_client_config" "client" {}

module "network" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-vpc.git?ref=v1.0.0"

  folder_id  = data.yandex_client_config.client.folder_id
  blank_name = "certificate-manager-dns"

  azs = ["ru-central1-a"]

  private_subnets    = [["10.17.0.0/24"]]
  create_vpc         = true
  create_nat_gateway = true
}

module "dns_zone" {

  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/zone?ref=v1.0.0"

  name             = "my-private-zone"
  zone             = "dns-zone.org.ru."
  is_public        = true
  private_networks = [module.network.vpc_id] # можете заменить на ваш network_id
}

module "address" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-address.git"

  name    = "test"
  zone_id = "ru-central1-a"
  dns_record = {
    fqdn        = "test"
    dns_zone_id = module.dns_zone.id
    ttl         = 300
    ptr         = true
  }
}

module "dns_recordset" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset?ref=v1.0.0"

  zone_id = module.dns_zone.id
  name    = "test.dns-zone.org.ru."
  type    = "A"
  ttl     = 200
  data    = [module.address.external_ipv4_address]
}

module "dns_letsencrypt" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/recordset?ref=v1.0.0"

  zone_id = module.dns_zone.id
  name    = module.managed.managed_certificates["test"].challenges[0].dns_name
  type    = "CNAME"
  ttl     = 200
  data    = [module.managed.managed_certificates["test"].challenges[0].dns_value]
}

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
