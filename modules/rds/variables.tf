variable "project_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}