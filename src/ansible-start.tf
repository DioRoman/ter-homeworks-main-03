resource "null_resource" "web_hosts_provision" {
depends_on = [yandex_compute_instance.web]
#Запуск ansible-playbook
    provisioner "local-exec" {
        command = "ansible-playbook -i hosts.yml test.yml"
        interpreter = ["bash"]
        environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
    }
}