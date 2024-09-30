data "yandex_compute_image" "ubuntu" {
  family = var.vm_image
}
resource "yandex_compute_instance" "web" {
  count       = 2
  name        = "web-${count.index + 1}"
  platform_id = var.web_platform
  zone        = var.default_zone
  resources {
    cores         = var.web_cores
    memory        = var.web_memory
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
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
  depends_on = [yandex_compute_instance.db]  
}
