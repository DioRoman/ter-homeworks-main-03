resource "yandex_compute_instance" "db" {

    for_each = toset(["0", "1"])

    name        = "db-${ var.vms_db[each.key].vm_name }"
    platform_id = var.vms_db[each.key].platform

    resources {
        cores         = var.vms_db[each.key].cores
        memory        = var.vms_db[each.key].memory
        core_fraction = var.vms_db[each.key].core_fraction
    }

    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }

    scheduling_policy {
        preemptible = var.vms_db[each.key].preemptible
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