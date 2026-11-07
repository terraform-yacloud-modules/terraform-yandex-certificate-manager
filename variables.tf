variable "self_managed" {
  description = "Self-managed certificate specification."
  type = map(object({
    description                = optional(string, "")                                  # Certificate description.
    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.
    certificate                = string                                                # Certificate with chain (required).
    private_key                = optional(string, null)                                # Private key of certificate.
    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.
    folder_id                  = optional(string, null)                                # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
    deletion_protection        = optional(bool, false)                                 # Protection from accidental deletion of the certificate.
  }))
  default = {}
}

variable "managed" {
  description = "Managed certificate specification."
  type = map(object({
    domains             = list(string)                  # List of domains for this certificate (required)
    description         = optional(string, "")          # Certificate description.
    labels              = optional(map(string), {})     # Labels to assign to this certificate.
    challenge_type      = optional(string, "DNS_CNAME") # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP
    challenge_count     = optional(number, 1)           # Expected number of challenge count needed to validate certificate.
    folder_id           = optional(string, null)        # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
    deletion_protection = optional(bool, false)         # Protection from accidental deletion of the certificate.
  }))
  default = {}
}

variable "certificate_iam_members" {
  description = "Map of IAM member bindings for certificates. Key is a unique id; certificate_key must be an existing key in self_managed or managed."
  type = map(object({
    certificate_key  = string           # Key of the certificate in var.self_managed or var.managed.
    certificate_type = string           # Either 'self_managed' or 'managed'.
    role             = string           # IAM role (e.g. certificate-manager.certificates.downloader).
    member           = string           # Identity: serviceAccount:id, userAccount:id, etc.
    sleep_after      = optional(number) # Delay in seconds after the resource is created, used to compensate IAM operations delay.
  }))
  default = {}

  validation {
    condition     = alltrue([for v in var.certificate_iam_members : contains(["managed", "self_managed"], v.certificate_type)])
    error_message = "certificate_type must be either \"managed\" or \"self_managed\"."
  }
}

variable "certificate_iam_bindings" {
  description = "Map of authoritative IAM role bindings for certificates. Key is a unique id; certificate_key must be an existing key in self_managed or managed. Only one binding per role per certificate is allowed."
  type = map(object({
    certificate_key  = string           # Key of the certificate in var.self_managed or var.managed.
    certificate_type = string           # Either 'self_managed' or 'managed'.
    role             = string           # IAM role (e.g. certificate-manager.viewer).
    members          = set(string)      # Identities: serviceAccount:id, userAccount:id, etc.
    sleep_after      = optional(number) # Delay in seconds after the resource is created, used to compensate IAM operations delay.
  }))
  default = {}

  validation {
    condition     = alltrue([for v in var.certificate_iam_bindings : contains(["managed", "self_managed"], v.certificate_type)])
    error_message = "certificate_type must be either \"managed\" or \"self_managed\"."
  }
}
