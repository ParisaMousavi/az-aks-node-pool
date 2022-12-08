variable "name" {
  type = string
}

variable "kubernetes_cluster_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "node_count" {
  type = number
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}

variable "enable_auto_scaling" {
  type = bool
}

variable "min_count" {
  type = number
}

variable "max_count" {
  type = number
}

variable "vnet_subnet_id" {
  type    = string
  default = null
}

variable "zones" {
  type = list(number)
}

variable "os_type" {
  type    = string
  default = "Linux"
}

variable "scale_down_mode" {
  type    = string
  default = "Delete"
  validation {
    condition     = contains(["Delete", "Deallocate"], var.scale_down_mode)
    error_message = "The valid values are Delete or Deallocate."
  }
}
