module "testsecret" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-lockbox.git"

  name   = "testsecret"
  labels = {}

  entries = {
    "key-a" : "value-a"
    "key-pem" : file("key.pem")
  }

  deletion_protection = false
}


module "self_managed" {
  source = "../.."

  self_managed = {
    domain-com = {
      description = "self-managed domain certificate from file"
      certificate = file("cert.pem")
      private_key = file("key.pem")
    }
    example_com = {
      description = "self-managed domain certificate from lockbox"
      certificate = "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- \n -----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----"
      private_key_lockbox_secret = {
        id  = module.testsecret.id
        key = "key-pem"
      }
    }
  }
}
