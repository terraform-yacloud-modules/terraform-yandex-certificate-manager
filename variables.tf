variable "managed" {
  description = "Managed certificate specification."
  type = map(object({
    challenge_count     = optional(number, 1)           # Expected number of challenge count needed to validate certificate.
    challenge_type      = optional(string, "DNS_CNAME") # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP
    deletion_protection = optional(bool, false)         # Protection against deletion of the certificate.
    description         = optional(string, "")          # Certificate description.
    domains             = optional(list(string), [])    # List of domains for this certificate.
    folder_id           = optional(string, null)        # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
    labels              = optional(map(string), {})     # Labels to assign to this certificate.
  }))
  default = {}
}

variable "self_managed" {
  description = "Self-managed certificate specification."
  type = map(object({
    certificate                = optional(string, null)                                # Certificate with chain.
    deletion_protection        = optional(bool, false)                                 # Protection against deletion of the certificate.
    description                = optional(string, "")                                  # Certificate description.
    folder_id                  = optional(string, null)                                # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.
    private_key                = optional(string, null)                                # Private key of certificate.
    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.
  }))
  default = {}
}
