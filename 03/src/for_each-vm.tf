resource "yandex_compute_instance" "db" {
  for_each = { for i, vm in var.each_vm : vm.vm_name => vm }
  name        = each.value.vm_name
  platform_id = var.web_platform
  zone = var.default_zone

  resources {
    cores         = each.value.cpu_cores
    memory        = each.value.ram_memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
    }
  }

  scheduling_policy {
    preemptible = var.web_scheduling_policy
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.web_nat_network_interface
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata_serial-port-enable
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
