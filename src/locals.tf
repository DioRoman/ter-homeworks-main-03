locals {
    serial-port-enable = 1
    ssh_key           = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
    instances_yaml= concat(yandex_compute_instance.web,yandex_compute_instance.db, yandex_compute_instance.storage)
}