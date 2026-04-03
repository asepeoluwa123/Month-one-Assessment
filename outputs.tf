output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "DNS name of the created Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "web_instance_ids" {
  description = "IDs of web server instances"
  value       = aws_instance.web[*].id
}

output "db_instance_id" {
  description = "ID of the database instance"
  value       = aws_instance.db.id
}
