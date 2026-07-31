# Production-Style AWS Infrastructure with Terraform

A production-style AWS Infrastructure project built using Terraform, following Infrastructure as Code (IaC) best practices.

## 🚀 Project Goals

- Learn Terraform from beginner to advanced
- Build AWS infrastructure using Infrastructure as Code
- Follow production-ready project structure
- Understand networking, security, and automation concepts
- Create a portfolio-quality DevOps project

---

## 🛠️ Technologies

- Terraform
- AWS
- Git & GitHub
- VS Code Remote SSH
- Ubuntu Linux

---

## 📅 Progress

### ✅ Day 1
- Project initialization
- Terraform installation
- AWS Provider configuration
- Variables
- Outputs

### ✅ Day 2
- Terraform workflow
- terraform init
- terraform validate
- terraform plan
- Terraform State

### ✅ Day 3
- Created custom VPC
- Default Tags
- Infrastructure as Code
- Applied first AWS resource

---

## 📌 Current Architecture

VPC (10.0.0.0/16)

---

More updates coming as the project progresses.

## 📅 Day 4 – Internet Gateway

### 🎯 Objective

Connect the VPC to the public Internet by creating and attaching an Internet Gateway using Terraform.

### 📚 Topics Learned

- AWS Internet Gateway (IGW)
- VPC Isolation
- Resource References
- Implicit Dependencies
- Terraform Workflow (`fmt → validate → plan → apply`)
- AWS Networking Fundamentals

### 🛠️ Tasks Completed

- Created an Internet Gateway using Terraform
- Attached the Internet Gateway to the custom VPC
- Used `aws_vpc.main.id` to reference the VPC
- Applied infrastructure using Terraform
- Verified the Internet Gateway in the AWS Console
- Updated project documentation
- Committed changes to Git

### 💡 Key Learnings

- An Internet Gateway is a highly available, AWS-managed component that enables communication between a VPC and the public Internet.
- Attaching an Internet Gateway to a VPC does **not** automatically provide Internet access.
- Internet access also requires:
  - A Public Subnet
  - A Route Table with `0.0.0.0/0` pointing to the Internet Gateway
  - A Route Table Association
  - A Public IP (or Elastic IP) for the EC2 instance
- Resource references such as `aws_vpc.main.id` eliminate the need to hardcode resource IDs.
- Terraform automatically creates an implicit dependency when one resource references another.

### 📁 Files Updated

- `terraform/main.tf`
- `terraform/provider.tf`

### ✅ Terraform Commands Executed

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

### 🌐 Infrastructure Status

- ✅ Custom VPC
- ✅ Internet Gateway
- ⏳ Public Subnet (Next)
- ⏳ Route Table
- ⏳ Security Group
- ⏳ EC2 Instance

### 📝 Commit Message

```
Day 4: Add Internet Gateway
```
