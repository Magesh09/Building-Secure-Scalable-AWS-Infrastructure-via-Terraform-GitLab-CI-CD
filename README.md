# Building Scalable AWS Infrastructure with Terraform & GitLab CI/CD

This project showcases the end-to-end automation of a secure and scalable AWS cloud environment using *Terraform* and *GitLab CI/CD*. The infrastructure includes a VPC spanning multiple Availability Zones with both public and private subnets, NAT Gateway and Internet Gateway configurations, an Auto Scaling Group of EC2 instances running an Apache server, and an Application Load Balancer (ALB) for external access.

Infrastructure state is managed using a *remote Terraform backend*, allowing consistent tracking and resource management across environments.

---

## *Tech Stack Used*
- *Terraform* – Infrastructure as Code (IaC)
- *GitLab CI/CD* – Continuous Integration and Deployment
- *AWS Services:*
  - VPC, Subnets (Public & Private), Route Tables
  - Internet Gateway (IGW), NAT Gateway (NGW)
  - Application Load Balancer (ALB)
  - Launch Template & Auto Scaling Group (ASG)
  - EC2 Instances with Apache HTTP Server
  - Security Groups
- *Terraform Backend* – Remote S3-based state management

---

## *Key Features*
- Highly available infrastructure spanning two Availability Zones
- Public and private subnet setup with appropriate routing
- Internet Gateway for public access
- NAT Gateway for secure private subnet access to the internet
- Application Load Balancer in public subnet to distribute traffic
- Auto Scaling Group with EC2 instances deployed in private subnets
- Apache HTTP server on EC2 to serve a simple web app
- Automated deployment pipeline using GitLab CI/CD
- Remote backend to manage Terraform state

---

## *Security Groups Overview*
- *ALB Security Group:*
  - Allows inbound HTTP traffic (port 80) from anywhere
  - Allows all outbound traffic

- *EC2 Instance Security Group:*
  - Allows inbound HTTP traffic *only from the ALB Security Group*
  - Allows all outbound traffic
  - Blocks all direct access from the internet, enhancing security

This configuration ensures that EC2 instances in the private subnet are not directly exposed to the internet. Only the ALB can communicate with them, enforcing a secure architecture.

---

## *How It Works*
1. *VPC Setup* across two Availability Zones to ensure redundancy and fault tolerance.
2. *Public Subnets* host the Application Load Balancer and NAT Gateway.
3. *Private Subnets* host the Auto Scaling EC2 instances (Apache server).
4. *Internet Gateway* provides internet access to the public subnet.
5. *NAT Gateway* in a public subnet allows private subnet instances to reach the internet securely (for updates, etc.).
6. *Route Tables* are configured to direct traffic accordingly:
   - Public route table points to Internet Gateway
   - Private route table points to NAT Gateway
7. *ALB* forwards traffic to EC2 instances via target groups.
8. *Security Groups* ensure fine-grained traffic control.
9. *GitLab CI/CD* automates provisioning:
   - terraform init, plan, and apply are run as part of the pipeline
10. *Remote Backend* in S3 manages Terraform state centrally, enabling consistent and safe deployments.

---

## *CI/CD Automation via GitLab*
- GitLab pipeline automates infrastructure creation:
  - Initializes Terraform
  - Validates and plans changes
  - Applies changes automatically to AWS
- Reduces manual work and increases reliability

---

## *Conclusion*
This project is a production-ready example of using *Terraform + GitLab CI/CD* for deploying cloud-native architectures. It demonstrates secure network design, scalability, and automated infrastructure management — all crucial components in a modern DevOps workflow.