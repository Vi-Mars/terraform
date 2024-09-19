resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


resource "yandex_vpc_subnet" "db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
}



data "yandex_compute_image" "ubuntu" {
#   family = "ubuntu-2004-lts"
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
# name        = "netology-develop-platform-web"
#  platform_id = "standard-v3"
#  resources {
#    cores         = 2
#    memory        = 1
#    core_fraction = 20
  name = local.web_local_name   
# name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
#    cores         = var.vm_web_cores
  cores = var.vms_resources.web.cores
  memory = var.vms_resources.web.memory
  core_fraction = var.vms_resources.web.core_fraction  
#    memory        = var.vm_web_memory
#    core_fraction = var.vm_web_core_fraction
  }
  metadata = {
    serial-port-enable = var.metadata.instance.serial-port-enable
    ssh-keys           = var.metadata.instance.ssh-keys
  }


  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
#    preemptible = true
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
 #   nat       = true
    nat       = var.vm_web_nat
  }

#  metadata = {
#    serial-port-enable = 1
#    serial-port-enable = var.vm_web_serial-port-enable
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

}

resource "yandex_compute_instance" "platform_db" {
  name = local.db_local_name
#  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
#    cores         = var.vm_db_cores
#    memory        = var.vm_db_memory
#    core_fraction = var.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = var.metadata.instance.serial-port-enable
    ssh-keys           = var.metadata.instance.ssh-keys
  }

#    serial-port-enable = var.vm_db_serial-port-enable
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }
}
