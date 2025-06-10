###cloud vars

#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  default     = "b1g2uh898q9ekgq43tfq"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g22qi1cc8rq4avqgik"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_metadata" {
 type = object({
   serial-port-enable = number
   ssh-keys           = string
 })
 default = {
     serial-port-enable = 1
     ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYMl6i1/RbSwM3vsYIkgYPo+wrPcxc2aZ1AODdCqTPM root@dio-mainpc"
   }
}

variable "vm_web_nat" {
  type        = bool
  default     = true
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2404-lts"
}