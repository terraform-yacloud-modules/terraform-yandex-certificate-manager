module "self_managed" {
  source = "../.."

#   folder_id = "xxx"
  self_managed = {
    domain_com = {
      description = "self-managed domain certificate from file"
      certificate = file("cert.pem")
      private_key = file("key.pem")
    }
    example_com = {
      description = "self-managed domain certificate from lockbox"
      certificate = "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- \n -----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----"
      private_key_lockbox_secret = {
        id  = "lockbox_id"
        key = "lockbox_key"
      }
    }
  }
}
