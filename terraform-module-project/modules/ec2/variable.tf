variable "ami" {
  description = "AMI ID for the instance"
}

variable "instance_type" {
  description = "Instance type"
}

variable "security_group_id" {
  description = "Security group ID"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "key_name" {
  description = "Key pair for SSH access"
}
