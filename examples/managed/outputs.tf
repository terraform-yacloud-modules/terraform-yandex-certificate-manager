output "instance_private_ip" {
  value = module.yandex_compute_instance.instance_private_ip
}

output "instance_public_ip" {
  value = module.yandex_compute_instance.instance_public_ip
}

output "zone_id" {
  description = "The unique identifier of the DNS zone created by the module."
  value       = module.dns_zone.id
}

output "test_certificate" {
  description = "Certificate details for test"
  value       = module.managed.managed_certificates["test"]
}
