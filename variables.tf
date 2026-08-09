# Project


variable "project_name" {
  description = "Project Name"
  type        = string
}


# VPC

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_a" {
  description = "Public Subnet A CIDR"
  type        = string
}

variable "public_subnet_b" {
  description = "Public Subnet B CIDR"
  type        = string
}

variable "private_subnet_a" {
  description = "Private Subnet A CIDR"
  type        = string
}

variable "private_subnet_b" {
  description = "Private Subnet B CIDR"
  type        = string
}


# EC2

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

# RDS

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "db_username" {
  description = "Database Username"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}