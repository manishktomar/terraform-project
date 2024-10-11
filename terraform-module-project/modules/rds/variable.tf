variable "instance_class" {
  description = "DB instance class"
}

variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "security_group_id" {
  description = "Security group ID for RDS"
}

variable "db_subnet_group" {
  description = "RDS Subnet Group"
}
