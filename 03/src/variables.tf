###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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

variable "vm_image" {
  type = string
  default = "ubuntu-2004-lts"
  description = "VM image"
}

variable "web_platform" {
  type = string
  default = "standard-v3"
  description = "VM platform id"
}
variable "web_cores" {
  type = number
  default = 2
  description = "VM core number"
}
variable "web_memory" {
  type = number
  default = 2
  description = "VM memory number"
}
variable "web_core_fraction" {
  type = number
  default = 20
  description = "VM core fraction"
}
variable "web_scheduling_policy" {
  type = bool
  default = true
  description = "VM preemptible"
}
variable "web_nat_network_interface" {
  type = bool
  default = true
  description = "VM nat"
}

variable "metadata_serial-port-enable" {
  type = number
  default = 1
  description = "metadata_serial-port-enable"
}


