resource "yandex_compute_disk" "disks" {
  count    = var.storage.disk.count
  name     = "${var.storage.disk.name}-${count.index + 1}"
  type     = var.storage.disk.type
  zone     = var.storage.disk.zone
  size     = var.storage.disk.size
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage.vm_name
  platform_id = var.storage.vm_platform
  zone        = var.storage.vm_zone

  resources {
    cores         = var.storage.vm_cores
    memory        = var.storage.vm_memory
    core_fraction = var.storage.vm_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.storage.vm_preemtable
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.storage.vm_network_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks
    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = {
    serial-port-enable = var.metadata.vm.serial-port-enable
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}

