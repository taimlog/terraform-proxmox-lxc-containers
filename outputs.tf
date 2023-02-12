output "ubuntu_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}

output "ubuntu_container_private_key" {
  value     = tls_private_key.ubuntu_container_key.private_key_pem
  sensitive = true
}

output "ubuntu_container_public_key" {
  value = tls_private_key.ubuntu_container_key.public_key_openssh
}

output "name" {
  value       = module.common-name-generator.name
  description = "Normalized name"
}

output "id" {
  value       = module.common-name-generator.id
  description = "Disambiguated ID string restricted to `id_length_limit` characters in total"
}

output "tags" {
  value       = module.common-name-generator.label_order
  description = "The merged additional_tag_map"
}

