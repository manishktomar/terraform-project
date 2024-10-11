output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.web.alb_dns_name
}

output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.database.db_endpoint
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

