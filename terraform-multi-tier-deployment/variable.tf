variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

# VPC CIDR Block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# Subnets CIDR Blocks
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "db_subnet_cidr" {
  description = "CIDR block for the database subnet"
  default     = "10.0.3.0/24"
}

# EC2 instance type for the frontend and backend tiers
variable "frontend_instance_type" {
  description = "Instance type for frontend web servers"
  default     = "t2.micro"
}

variable "backend_instance_type" {
  description = "Instance type for backend application servers"
  default     = "t2.micro"
}

# Database variables
variable "db_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database admin username"
}

variable "db_password" {
  description = "Database admin password"
}

# Route53 domain name
variable "domain_name" {
  description = "Domain name for Route53"
}
