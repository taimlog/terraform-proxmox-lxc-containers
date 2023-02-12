variable "naming-generator" {
  type = object({
    naming_generator_enabled = bool
    environment              = string
    resource                 = string
    name                     = string
    delimiter                = string
    tags                     = list(string)
  })
}

variable "description" {
  type = string
}

variable "pool" {
  type    = string
  default = "pool-01"
}

variable "node_name" {
  type    = string
  default = "node-01"
}

variable "vm_id" {
  type = number
}

variable "domain" {
  type    = string
  default = "test.com"
}

variable "server" {
  type    = string
  default = "192.168.0.1"
}

variable "ip_config_type" {
  type    = string
  default = "dhcp"
}

variable "gateway" {
  type = string
}

variable "network_bridge_name" {
  type    = string
  default = "default-bridge"
}

variable "cpu_cores" {
  type = number
}

variable "storage_pool" {
  type    = string
  default = "storage"
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "dedicated_ram" {
  type    = string
  default = "1024"
}

variable "swap" {
  type    = string
  default = "512"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "network_enabled" {
  type    = bool
  default = true
}

variable "mtu" {
  type    = number
  default = 1500
}

variable "datastore_template_location" {
  type    = string
  default = "stoage"
}
variable "template_node_name" {
  type    = string
  default = "node-01"
}

variable "source_file_path" {
  type = string
}

variable "os_type" {
  type = string
}

variable "content_type" {
  type = string
}