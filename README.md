# 🚀 Production-Ready AWS Three-Tier Infrastructure using Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws)
![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

# 📖 Overview

This project demonstrates how to provision a **production-ready AWS Three-Tier Infrastructure** using **Terraform** following Infrastructure as Code (IaC) best practices.

The goal of this repository is to simulate how cloud infrastructure is deployed in enterprise environments using reusable Terraform modules.

---

# 🏗 Current Progress

- ✅ AWS CLI Configured
- ✅ Terraform Installed
- ✅ VPC Module Created
- ⏳ Internet Gateway
- ⏳ Public Subnets
- ⏳ Private Subnets
- ⏳ NAT Gateway
- ⏳ Route Tables
- ⏳ Security Groups
- ⏳ EC2
- ⏳ Application Load Balancer
- ⏳ Auto Scaling
- ⏳ Amazon RDS

---

# ☁ AWS Services

- Amazon VPC
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2
- Application Load Balancer
- Auto Scaling
- Amazon RDS
- IAM
- CloudWatch

---

# 📂 Project Structure

```
terraform/
│
├── modules/
│     └── vpc/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── versions.tf
```

---

# 🚀 Deployment

```bash
terraform init

terraform validate

terraform plan

terraform apply
```

---

# 📸 Project Screenshots

## Terraform Apply

![Terraform Apply](screenshots/terraform-apply.png)

---

## AWS VPC

![AWS VPC](screenshots/vpc.png)

---

# 🏗 Architecture

> Architecture diagram will be added as the project progresses.

---

# 📚 Learning Objectives

- Infrastructure as Code
- AWS Networking
- Terraform Modules
- AWS Best Practices
- Production Infrastructure Design
- GitHub Portfolio

---

# 🛣 Roadmap

- [x] Create VPC
- [ ] Internet Gateway
- [ ] Public Subnets
- [ ] Private Subnets
- [ ] NAT Gateway
- [ ] Route Tables
- [ ] Security Groups
- [ ] EC2
- [ ] ALB
- [ ] Auto Scaling
- [ ] Amazon RDS
- [ ] GitHub Actions CI/CD
- [ ] Monitoring

---

# 👨‍💻 Author

**Altaf Bagwan**

Cloud & DevOps Engineer

GitHub: https://github.com/altaf2258

LinkedIn: *(Add your LinkedIn profile URL here)*

---

⭐ If you found this project useful, consider giving it a star.