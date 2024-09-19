variable "vm_web_family" {
  default = "ubuntu-2004-lts"
}
variable "vm_web_name" {
  type = string
  default = "netology-develop-platform-web"
}
variable "vm_web_platform_id" {
  type = string
  default = "standard-v3"
}
#variable "vm_web_cores" {
#  type = number
#  default = 2
#}
#variable "vm_web_memory" {
#  type = number
#  default = 1
#}
#variable "vm_web_core_fraction" {
#  type = number
#  default = 20
#}
variable "vm_web_preemptible" {
  type = bool
  default = true
}
variable "vm_web_nat" {
  type = bool
  default = true
}
variable "vm_web_serial-port-enable" {
  type = number
  default = 1
}



variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}
variable "vm_db_platform_id" {
  type = string
  default = "standard-v3"
}
#variable "vm_db_cores" {
#  type = number
#  default = 2
#}
#variable "vm_db_memory" {
#  type = number
#  default = 2
#}
#variable "vm_db_core_fraction" {
#  type = number
#  default = 20
#}
variable "vm_db_preemptible" {
  type = bool
  default = true
}
variable "vm_db_nat" {
  type = bool
  default = true
}
variable "vm_db_serial-port-enable" {
  type = number
  default = 1
}

variable "default_zone_db" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 20
    },
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}


variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    instance = {
      serial-port-enable = 1
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOir0I6tzwAJcxVJnjG5TqGEx3wCl8mIO3yZ18PIWBjR vz@vz-VirtualBox"
    }
  }
}

