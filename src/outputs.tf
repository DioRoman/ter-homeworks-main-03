output "VM_stats" {
  value = ([
    [
        for vm in yandex_compute_instance.web : {
            name = vm.name
            id   = vm.id
            fqdn = vm.fqdn
      }
    ]
    ,
    [
        for vm in yandex_compute_instance.db : {
            name = vm.name
            id   = vm.id
            fqdn = vm.fqdn
      }
    ]
  ])
}