# TechCorp Terraform Assessment

## Overview
This Terraform configuration deploys a HA web application infra on AWS:
- VPC with public/private subnets in 2 AZs
- Internet Gateway + 2 NAT Gateways
- Bastion host
- Web servers in private subnet behind Application Load Balancer
- DB server in private subnet
- Security groups for bastion/web/db

## Prerequisites
- Terraform v1.0+
- AWS credentials configured
- Existing AWS key pair in the chosen region

## Setup
1. Copy example variables:
   ```powershell
   cd "c:\Users\hp\Desktop\asepeoluwa server\vagrant\boxes\ubuntu20.04-LTS\terraform-handson\Terraform Assessment"
   copy terraform.tfvars.example terraform.tfvars
   # edit terraform.tfvars: key_name, my_ip
   ```

2. Init + plan + apply
   ```powershell
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan
   ```

## Destroy
```powershell
terraform destroy -auto-approve
```

## Validation
- Output values: `vpc_id`, `alb_dns_name`, `bastion_public_ip`
- SSH to bastion:
  `ssh -i <key>.pem ec2-user@${bastion_public_ip}`
- From bastion, SSH to private web/db instances using private IPs
- ALB URL should return a web page showing instance IDs
- Postgres should be running on DB server port 5432
