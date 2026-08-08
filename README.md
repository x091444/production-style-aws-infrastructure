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

## 📅 Day 5 – Public Subnet

### 🎯 Objective

Create a Public Subnet inside the custom VPC to prepare the network for hosting internet-facing resources.

### 📚 Topics Learned

- AWS Subnets
- CIDR Blocks
- Public vs Private Subnets
- Availability Zones (AZs)
- Public IP Assignment
- Resource References
- CIDR Validation
- Overlapping Subnet Rules

### 🛠️ Tasks Completed

- Created a Public Subnet using Terraform
- Attached the subnet to the custom VPC
- Configured the subnet with CIDR block `10.0.1.0/24`
- Selected Availability Zone `ap-south-1a`
- Enabled automatic Public IP assignment using `map_public_ip_on_launch`
- Validated Terraform configuration
- Generated and reviewed the execution plan
- Applied the infrastructure successfully
- Verified the subnet in the AWS Management Console

### 💡 Key Learnings

- A subnet is a logical subdivision of a VPC that divides a larger network into smaller IP ranges.
- Every subnet must use a CIDR block that falls within the VPC's CIDR range.
- AWS does not allow overlapping subnet CIDR ranges within the same VPC.
- Enabling `map_public_ip_on_launch` automatically assigns a public IPv4 address to EC2 instances launched in the subnet.
- A subnet is not truly "public" until a Route Table containing a default route (`0.0.0.0/0`) to an Internet Gateway is associated with it.

### 📁 Files Updated

- `terraform/main.tf`

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
- ✅ Public Subnet
- ⏳ Route Table
- ⏳ Route Table Association
- ⏳ Security Group
- ⏳ EC2 Instance

### 📝 Commit Message

```text
Day 5: Add Public Subnet
```

## 📅 Day 6 – Public Route Table & Route Table Association

### 🎯 Objective

Configure internet routing for the Public Subnet by creating a Public Route Table and associating it with the subnet.

### 📚 Topics Learned

- AWS Route Tables
- Routes
- Default Route (`0.0.0.0/0`)
- Internet Gateway Routing
- Route Table Association
- Network Traffic Flow
- Public Subnet Routing

### 🛠️ Tasks Completed

- Created a Public Route Table using Terraform
- Added a default route (`0.0.0.0/0`) pointing to the Internet Gateway
- Associated the Public Route Table with the Public Subnet
- Validated the Terraform configuration
- Reviewed the Terraform execution plan
- Applied the infrastructure successfully
- Verified the Route Table and Subnet Association in the AWS Management Console

### 💡 Key Learnings

- A Route Table is a collection of routes that determines where network traffic should be forwarded.
- The Internet Gateway provides internet connectivity but does not route traffic by itself.
- The default route (`0.0.0.0/0`) forwards all internet-bound traffic to the Internet Gateway.
- A Route Table must be associated with a subnet before the subnet can use its routing rules.
- A Public Subnet becomes truly public only after it is associated with a Route Table containing a default route to an Internet Gateway.

### 📁 Files Updated

- `terraform/main.tf`

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
- ✅ Public Subnet
- ✅ Public Route Table
- ✅ Route Table Association
- ⏳ Security Group
- ⏳ EC2 Instance
- ⏳ Private Subnet
- ⏳ NAT Gateway

### 🏗️ Current Architecture

```text
                    Internet
                        │
                        ▼
               Internet Gateway
                        ▲
                        │
         Public Route Table
      0.0.0.0/0 → Internet Gateway
                        ▲
                        │
       Route Table Association
                        ▲
                        │
+--------------------------------------------------+
| VPC (10.0.0.0/16)                                |
|                                                  |
|  Public Subnet (10.0.1.0/24)                     |
|  Auto Public IP Enabled                          |
|                                                  |
+--------------------------------------------------+
```

### 📝 Commit Message

```text
Day 6: Add Public Route Table and Route Table Association
```

## 📅 Day 7 – Security Group

### 🎯 Objective

Create a Security Group to control inbound and outbound traffic for future EC2 instances.

### 📚 Topics Learned

- Security Groups
- Inbound rules
- Outbound rules
- SSH (Port 22)
- HTTP (Port 80)
- Security Groups vs Route Tables
- Security Groups as virtual firewalls

### 🛠️ Tasks Completed

- Created a Security Group inside the custom VPC
- Allowed SSH traffic on port 22
- Allowed HTTP traffic on port 80
- Allowed all outbound traffic
- Validated the Terraform configuration
- Reviewed the Terraform plan
- Successfully created the Security Group
- Verified the Security Group in the AWS Console

### 💡 Key Learning

A Security Group acts as a virtual firewall for AWS resources such as EC2 instances.

A Route Table decides **where network traffic goes**, while a Security Group decides **whether the traffic is allowed**.

```text
Route Table
    ↓
Where should the traffic go?

Security Group
    ↓
Should the traffic be allowed?
```

### 🔐 Security Group Rules

| Direction | Protocol | Port | Source |
|---|---|---:|---|
| Inbound | TCP | 22 | 0.0.0.0/0 |
| Inbound | TCP | 80 | 0.0.0.0/0 |
| Outbound | All | All | 0.0.0.0/0 |

> **Note:** SSH is currently open to `0.0.0.0/0` for learning purposes. In a production environment, SSH access should be restricted to trusted sources or replaced with a more secure access method.

### 📁 Terraform Resource

```hcl
aws_security_group.public
```

### 🆔 AWS Resource

```text
Security Group ID:
sg-0301eccd22e20edd4
```

### ✅ Terraform Commands

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

### 🏗️ Current Infrastructure

```text
                    Internet
                        │
                        ▼
               Internet Gateway
                        │
                        ▼
                Public Route Table
                        │
                        ▼
                 Public Subnet
                        │
                        ▼
                  Security Group
                        │
                        ▼
                 Future EC2
```

### 📈 Project Progress

- ✅ VPC
- ✅ Internet Gateway
- ✅ Public Subnet
- ✅ Public Route Table
- ✅ Route Table Association
- ✅ Security Group
- ⏳ EC2 Instance
- ⏳ Private Subnet
- ⏳ NAT Gateway
