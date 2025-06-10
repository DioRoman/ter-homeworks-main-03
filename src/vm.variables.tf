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