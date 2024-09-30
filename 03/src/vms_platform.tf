variable "each_vm" {
  type = list(object({
    vm_name = string
    cpu_cores = number
    ram_memory = number
    core_fraction = number
    disk_volume = number
  }))
  default = [
    {
     vm_name = "main"
     cpu_cores = 2
     ram_memory = 4
     core_fraction = 20
     disk_volume = 10
    },
    {
      vm_name = "replica"
      cpu_cores = 2
      ram_memory = 4
      core_fraction = 20
      disk_volume = 10
    }]
}

variable "storage" {
  type = object({
    vm_name             = string
    vm_cores            = number
    vm_memory           = number
    vm_core_fraction    = number
    vm_platform         = string
    vm_zone             = string
    vm_preemtable       = bool
    vm_network_nat      = bool
    disk = object({
      count    = number
      name     = string
      type     = string
      zone     = string
      size     = number
    })
  })
  default = {
    vm_name             = "storage"
    vm_cores            = 2
    vm_memory           = 4
    vm_core_fraction    = 20
    vm_platform         = "standard-v3"
    vm_zone             = "ru-central1-a"
    vm_preemtable       = true
    vm_network_nat      = true
    disk = {
      count    = 3
      name     = "disk"
      type     = "network-hdd"
      zone     = "ru-central1-a"
      size     = 1
    }
  }
}

variable "metadata" {
  type = map(object({
    serial-port-enable = number
  }))
  default = {
    vm = {
    serial-port-enable = 1
#    ssh-keys = 
    }
  }
}
