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

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the web layer"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
}

variable "db_engine" {
  description = "The database engine (e.g., MySQL or PostgreSQL)"
  default     = "mysql"
}

variable "db_instance_class" {
  description = "The RDS instance class"
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

variable "alb_healthy_threshold" {
  description = "Healthy threshold for ALB health checks"
  default     = 3
}
