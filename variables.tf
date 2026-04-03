variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type_web" {
  description = "EC2 instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "instance_type_db" {
  description = "EC2 instance type for database server"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Name of existing SSH key pair to use for EC2 instances"
  type        = string
  default     = "techcorp-key"
}

variable "my_ip" {
  description = "Your current public IP address for bastion SSH access (CIDR notation)"
  type        = string
  default     = "0.0.0.0/0"
}
