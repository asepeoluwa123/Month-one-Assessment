## Deployment Evidence Checklist

Capture the following screenshots and place them in this folder:

### 1. Terraform Plan Output
**File**: `01-terraform-plan.png`
**Command**: 
```powershell
terraform plan
```
**What to capture**: Show the full plan output with resource count summary

---

### 2. Terraform Apply Completion
**File**: `02-terraform-apply.png`
**Command**: 
```powershell
terraform apply -auto-approve tfplan
```
**What to capture**: Show the completion message with "Apply complete" and outputs displayed

---

### 3. AWS Console - VPC Resources
**File**: `03-aws-vpc-resources.png`
**Navigation**: AWS Console > VPC > Your VPCs
**What to capture**: Show techcorp-vpc with CIDR 10.0.0.0/16 and all its properties

---

### 4. AWS Console - Subnets
**File**: `04-aws-subnets.png`
**Navigation**: AWS Console > VPC > Subnets
**What to capture**: Show all 4 subnets (2 public, 2 private) with correct CIDR blocks

---

### 5. AWS Console - EC2 Instances
**File**: `05-aws-instances.png`
**Navigation**: AWS Console > EC2 > Instances
**What to capture**: Show all 4 instances (1 bastion, 2 web, 1 db) with their status and availability zones

---

### 6. AWS Console - Load Balancer
**File**: `06-aws-alb.png`
**Navigation**: AWS Console > EC2 > Load Balancers
**What to capture**: Show techcorp-alb with its DNS name and target group status

---

### 7. ALB Target Group Health
**File**: `07-aws-target-group-health.png`
**Navigation**: AWS Console > EC2 > Target Groups > techcorp-web-tg
**What to capture**: Show both web server targets are "Healthy"

---

### 8. Web Access via ALB URL
**File**: `08-alb-web-page.png`
**Action**: Open in browser:
```
http://techcorp-alb-2015574866.us-east-1.elb.amazonaws.com
```
**What to capture**: Show the HTML page with "TechCorp Web Server" and instance ID

---

### 9. SSH to Bastion Host
**File**: `09-ssh-bastion.png`
**Command**: 
```powershell
ssh -i C:\path\to\yourkey.pem ec2-user@3.238.38.101
```
**What to capture**: Show successful connection prompt

---

### 10. SSH from Bastion to Web Server
**File**: `10-ssh-web-from-bastion.png`
**From bastion (after SSH in), run**:
```bash
ssh -i /path/to/key.pem ec2-user@10.0.3.X  # replace with private IP
```
**What to capture**: Show successful connection to private web server

---

### 11. SSH from Bastion to DB Server
**File**: `11-ssh-db-from-bastion.png`
**From bastion, run**:
```bash
ssh -i /path/to/key.pem ec2-user@10.0.3.Y  # replace with DB private IP
```
**What to capture**: Show successful connection to private DB server

---

### 12. PostgreSQL Connection Check
**File**: `12-postgres-connection.png`
**From bastion or DB server**:
```bash
psql -h 10.0.3.Y -U postgres -c '\l'
```
*Note: If passwordless access isn't configured, password will be prompted*
**What to capture**: Show successful connection and list of databases

---

### 13. Terraform Outputs
**File**: `13-terraform-outputs.png`
**Command**:
```powershell
terraform output
```
**What to capture**: Show all outputs (VPC ID, ALB DNS, Bastion IP, instance IDs)

---

## Optional: Security Groups Verification
**File**: `14-security-groups.png`
**Navigation**: AWS Console > VPC > Security Groups
**What to capture**: Show all 3 security groups with ingress rules

---

## How to Submit

1. Place all screenshot files in this `evidence/` folder
2. Include the Terraform configuration files in parent directory
3. Create GitHub repo `month-one-assessment`
4. Push all files to GitHub:
   ```powershell
   git init
   git add .
   git commit -m "TechCorp Terraform Assessment Submission"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/month-one-assessment.git
   git push -u origin main
   ```

---

**Note**: Make sure terraform.tfstate is included (no sensitive data exposed since outputs show IPs/IDs only).
