variable "project_name" { type = string }
variable "environment" { type = string }
variable "subnet_ids" { type = list(string) }
variable "vpc_id" { type = string }
variable "master_username" { type = string }
variable "master_password" { type = string sensitive = true }
