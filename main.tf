module "common-name-generator" {
  source             = "../../../agnostic/naming-generator"
  enabled            = var.naming-generator.naming_generator_enabled
  environment        = var.naming-generator.environment
  stage              = var.naming-generator.resource
  name               = var.naming-generator.name
  delimiter          = var.naming-generator.delimiter
  labels_as_tags    = var.naming-generator.tags
}

resource "proxmox_virtual_environment_container" "ubuntu_container" {
  description = var.description
  node_name   = var.node_name
  vm_id       = var.vm_id
  tags        = module.common-name-generator.labels_as_tags
  pool_id     = var.pool

  initialization {
    hostname = "ct-${module.common-name-generator.id}"

    dns {
      domain = var.domain
      server = var.server
    }

    ip_config {
      ipv4 {
        address = var.ip_config_type
        gateway = var.gateway
      }
    }

    user_account {
      keys = [
        trimspace(tls_private_key.ubuntu_container_key.public_key_openssh)
      ]
      password = random_password.ubuntu_container_password.result
    }
  }

  memory {
    dedicated = var.dedicated_ram
    swap      = var.swap
  }

  disk {
    datastore_id = var.storage_pool
    size         = var.disk_size
  }

  cpu {
    cores = var.cpu_cores
  }

  network_interface {
    name    = var.network_bridge_name
    bridge  = var.network_bridge
    enabled = var.network_enabled
    mtu     = var.mtu
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_file.ubuntu_container_template.id
    type             = var.os_type
  }
}

resource "proxmox_virtual_environment_file" "ubuntu_container_template" {
  content_type = var.content_type
  datastore_id = var.datastore_template_location
  node_name    = var.template_node_name

  source_file {
    path = var.source_file_path
  }
}

resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

