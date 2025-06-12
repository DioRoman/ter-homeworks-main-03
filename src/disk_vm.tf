resource "yandex_compute_disk" "my_disk" {
    count    = var.vms_disk[0].count
    name     = "hdd-${count.index+1}"
    type     = var.vms_disk[0].type
    size     = var.vms_disk[0].size
    zone     = var.default_zone
}

resource "yandex_compute_instance" "storage" {
    depends_on = [yandex_compute_disk.my_disk]
    name        = var.vms_storage[0].vm_name
    platform_id = var.vms_storage[0].platform

    resources {
        cores         = var.vms_storage[0].cores
        memory        = var.vms_storage[0].memory
        core_fraction = var.vms_storage[0].core_fraction
    }

    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }

    dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.my_disk.*.id)

        content {
            disk_id = secondary_disk.key
         }
    }

    scheduling_policy {
        preemptible = var.vms_storage[0].preemptible
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