output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_instance.public_ip
}

output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.web_vpc.id
}