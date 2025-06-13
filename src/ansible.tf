# resource "local_file" "hosts_templatefile" {
#   content = templatefile("${path.module}/ansible.tftpl",
  
#   { 
#       web           = yandex_compute_instance.web
#       db            = yandex_compute_instance.db
#       storage       = [yandex_compute_instance.storage]
#   })

#   filename = "${abspath(path.module)}/hosts.yml"
# }

resource "local_file" "hosts_yaml" {
  content =  <<-EOT
  all:
    hosts:
    %{ for i in local.instances_yaml ~}
  ${i["name"]}:
          ansible_host: ${i["network_interface"][0]["nat_ip_address"] != null ? i["network_interface"][0]["nat_ip_address"] : i["network_interface"][0]["ip_address"]} 
          fqdn: fqdn=${i["fqdn"]}
    %{ endfor ~}
  EOT
  filename = "${abspath(path.module)}/hosts.yaml"
}