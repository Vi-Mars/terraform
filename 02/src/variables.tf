
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
  description = "VPC network & subnet name"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOir0I6tzwAJcxVJnjG5TqGEx3wCl8mIO3yZ18PIWBjR vz@vz-VirtualBox"
#  description = "ssh-keygen -t ed25519"
#}

variable "test" {
  type = list(map(list(string)))
  default = [
  {
    "dev1" = [
       "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
       "10.0.1.7",
    ]
  },
  {
    "dev2" = [
       "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
       "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
  ]
}
