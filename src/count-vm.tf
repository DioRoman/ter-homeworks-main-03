resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  count = 2
  name        = "web-${count.index+1}"
  platform_id = var.vms_resources["web"].platform
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources["web"].preemptible
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = var.vm_web_nat
  }
  metadata = {
      serial-port-enable = local.serial-port-enable
      ssh-keys           = local.ssh_key
  }
}