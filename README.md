# Building Secure & Scalable AWS Infrastructure with Terraform (IaC) & GitLab CI/CD

In this project, I designed and deployed a **secure and scalable AWS infrastructure** to host a web application by provisioning all AWS resources using **Terraform** (*Infrastructure as Code*) and **automating the entire deployment lifecycle** through a **GitLab CI/CD pipeline**.

---

## Architecture Diagram

![Architecture Diagram](images/Image1.png)  
![Architecture Diagram](images/Image2.png)

---

## Key Highlights

- ✅ Created a custom **VPC across 2 Availability Zones** for high availability  
- ✅ Set up **Public and Private Subnets** with proper routing and isolation  
- ✅ Configured **Internet Gateway** and **NAT Gateway** for secure internet access  
- ✅ Deployed **Application Load Balancer (ALB)** in public subnets to distribute traffic evenly  
- ✅ Launched **Auto Scaling Group (ASG)** with Apache web servers in private subnets to handle load dynamically  
- ✅ Implemented **Remote Terraform Backend** using S3 & DynamoDB for state management  
- ✅ Integrated **GitLab CI/CD** for complete infrastructure and application deployment automation  
- ✅ Defined **Strict Security Groups**:  
  - **ALB SG** allows HTTP access from the internet  
  - **EC2 SG** allows HTTP traffic only from the ALB, maintaining subnet isolation  

---

## Infrastructure Workflow

1. **VPC Setup** across two Availability Zones for redundancy and fault tolerance  
2. **Public Subnets** host the ALB and NAT Gateway  
3. **Private Subnets** host EC2 instances via Auto Scaling Group  
4. **Internet Gateway** enables internet access for public subnets  
5. **NAT Gateway** allows outbound internet access from private subnets securely  
6. **Route Tables** direct traffic:  
   - Public RT → Internet Gateway  
   - Private RT → NAT Gateway  
7. **ALB** routes HTTP traffic to EC2 instances registered in target groups  
8. **Security Groups** enforce traffic control policies  
9. **Terraform + GitLab CI/CD** handles the full provisioning lifecycle:  
   - `terraform init`, `plan`, and `apply` via GitLab pipeline  
10. **Remote Backend** (S3 + DynamoDB) manages Terraform state for consistency  

---

## What the Infrastructure Achieves

- ✅ Automatically **distributes incoming traffic** across healthy EC2 instances  
- ✅ **Scales up or down** based on load using Auto Scaling policies  
- ✅ Ensures a **secure and fault-tolerant architecture** with multi-AZ support and subnet isolation  
- ✅ Provides a **production-grade, fully automated deployment pipeline** with GitLab CI/CD  

---

## CI/CD Automation with GitLab

- GitLab pipeline automates:
  - Terraform initialization (`init`)  
  - Syntax and configuration validation (`validate`, `plan`)  
  - Resource provisioning (`apply`)  
- Ensures **zero manual intervention** and **repeatable deployments**  

---

## Tech Stack Used

- **Terraform** – Infrastructure as Code (IaC)  
- **GitLab CI/CD** – DevOps Automation  
- **AWS Services**:  
  - VPC, Subnets (Public & Private), Route Tables  
  - Internet Gateway, NAT Gateway  
  - Application Load Balancer (ALB)  
  - EC2 Instances with Apache HTTP Server  
  - Launch Template & Auto Scaling Group (ASG)  
  - Security Groups  
- **Apache Web Server** – Hosting Web Application  
- **S3 & DynamoDB** – Remote Terraform State Backend  

---

## Conclusion

This project delivers a **production-ready, secure, and scalable infrastructure** using **Terraform** and **GitLab CI/CD**. It demonstrates modern **DevOps principles** such as IaC, automation, security best practices, and high availability—paving the way for reliable and maintainable cloud-native deployments.
