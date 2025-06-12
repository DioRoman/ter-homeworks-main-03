variable "vms_resources" {
  type = map(object({        
        platform = string
        cores = number
        memory = number
        core_fraction = number
        hdd_size = number
        hdd_type = string
        preemptible = bool
}))
    default = {
        web = {
            platform      = "standard-v3"
            cores         = 2
            memory        = 2
            core_fraction = 20
            hdd_size = 10
            hdd_type = "network-hdd"
            preemptible     = true
        }
    }
}

variable "vms_db" {
  type = list(
     object({ vm_name = string, cores = number, memory = number, core_fraction = number, platform = string, preemptible = bool }))
  default = ([ 
    {vm_name = "main", cores = 2, memory = 2, core_fraction = 20, platform = "standard-v3", preemptible = true}, 
    {vm_name = "replica", cores = 4, memory = 2, core_fraction = 20, platform = "standard-v3", preemptible = true}])
}

variable "vms_storage" {
  type = list(
     object({ vm_name = string, cores = number, memory = number, core_fraction = number, platform = string, preemptible = bool }))
  default = ([ 
    {vm_name = "storage", cores = 2, memory = 2, core_fraction = 20, platform = "standard-v3", preemptible = true}])
}

variable "vms_disk" {
  type = list(
     object({ type = string, size = number, count = number }))
  default = ([ 
    { type = "network-hdd", size = 1, count = 3 }])
}