variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vm_os_simple" {
  type    = string
  default = "UbuntuServer"
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "vm_name_prefix" {
  type    = string
  default = "myvm"
}
