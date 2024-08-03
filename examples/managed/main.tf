data "yandex_vpc_network" "default" {
  name = "default"
}

module "dns_zone" {

  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-dns.git//modules/zone?ref=v1.0.0"

  name        = "my-private-zone"
  description = "desc"

  labels = {
    label1 = "label-1-value"
  }

  zone             = "dns-zone.org.ru."
  is_public        = true
  private_networks = [data.yandex_vpc_network.default.id] # можете заменить на ваш network_id
}

module "address-test1" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-address.git"

  name        = "test1"
  description = "Example address description"
  labels = {
    environment = "production"
  }
  zone_id = "ru-central1-a"
  dns_record = {
    fqdn        = "test1"
    dns_zone_id = module.dns_zone.id
    ttl         = 300
    ptr         = true
  }
}

module "address-test2" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-address.git"

  name        = "test2"
  description = "Example address description"
  labels = {
    environment = "production"
  }
  zone_id = "ru-central1-a"
  dns_record = {
    fqdn        = "test2"
    dns_zone_id = module.dns_zone.id
    ttl         = 300
    ptr         = true
  }
}

module "address-test3" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-address.git"

  name        = "test3"
  description = "Example address description"
  labels = {
    environment = "production"
  }
  zone_id = "ru-central1-a"
  dns_record = {
    fqdn        = "test3"
    dns_zone_id = module.dns_zone.id
    ttl         = 300
    ptr         = true
  }
}

module "managed" {
  source = "../../"

  managed = {
    test1 = {
      domains         = ["test1.dns-zone.org.ru"]
      description     = "Managed certificate for test1.dns-zone.org.ru"
      labels          = { "environment" = "production", "owner" = "admin" }
      challenge_type  = "DNS_CNAME"
      challenge_count = 1
    }
    test2 = {
      domains         = ["test2.dns-zone.org.ru"]
      description     = "Managed certificate for test2.dns-zone.org.ru"
      labels          = { "environment" = "staging", "owner" = "devops" }
      challenge_type  = "DNS_TXT"
      challenge_count = 1
    }
    test3 = {
      domains         = ["test3.dns-zone.org.ru", "www.dns-zone.org.ru"]
      description     = "Managed certificate for test3.dns-zone.org.ru and wildcard"
      labels          = { "environment" = "production", "owner" = "admin" }
      challenge_type  = "HTTP"
      challenge_count = 2
    }
  }
}
