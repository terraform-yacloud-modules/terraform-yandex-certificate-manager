module "testsecret" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-lockbox.git?ref=v1.0.0"

  name   = "testsecret"
  labels = {
    environment = "test"
    project     = "certificate-manager"
  }

  entries = {
    "key-a" : "value-a"
    "key-pem" : file("key.pem")
  }

  deletion_protection = false
}

module "self_managed" {
  source = "../../"

  self_managed = {
    domain-com = {
      description = "self-managed domain certificate from file"
      certificate = file("cert.pem")
      private_key = file("key.pem")
      labels = {
        type        = "self-managed"
        environment = "test"
      }
      deletion_protection = false
    }
    example-com = {
      description = "self-managed domain certificate from lockbox"
      certificate = file("cert.pem")
      private_key_lockbox_secret = {
        id  = module.testsecret.id
        key = "key-pem"
      }
      labels = {
        type        = "self-managed"
        source      = "lockbox"
        environment = "test"
      }
      deletion_protection = false
    }
  }

  depends_on = [module.testsecret]
}
