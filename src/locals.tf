locals {
    serial-port-enable = 1
    ssh_key           = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
}