variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_port" {
  type = number
}

variable "ingress_protocol" {
  type = string
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}

variable "source_security_group_id" {
  type    = string
  default = null
}

variable "enable_source_security_group_rule" {
  type    = bool
  default = false
}