# Node.js Kubernetes CI/CD Pipeline 🚀

This project automates the deployment of a **Node.js application** to **AWS EKS** using **GitHub Actions CI/CD**.

## Features
✅ Automated builds with **Docker & AWS ECR**
✅ Continuous deployment to **Kubernetes (EKS)**
✅ GitHub Actions for **CI/CD automation**
✅ Infrastructure as Code with **Terraform**

## Deployment Flow
1. **Push code to GitHub** → Triggers CI/CD
2. **GitHub Actions** builds & pushes Docker image to **ECR**
3. **Kubernetes Deployment** updates the running application

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/nodejs-eks-cicd.git
   cd nodejs-eks-cicd
   ```
2. Deploy the infrastructure:
   ```bash
   cd terraform
   terraform init
   terraform apply -auto-approve
   ```
3. Verify Kubernetes deployment:
   ```bash
   kubectl get pods
   kubectl get services
   ```

## Technologies Used
- **AWS EKS** (Elastic Kubernetes Service)
- **AWS ECR** (Elastic Container Registry)
- **Terraform** (Infrastructure as Code)
- **GitHub Actions** (CI/CD)
- **Docker** (Containerization)
- **Kubernetes** (Orchestration)

📌 **GitHub Repository**: [Your Repo URL](https://github.com/YOUR_GITHUB_USERNAME/nodejs-eks-cicd)
📌 **LinkedIn Post**: [Share your success & tag #DevOps](https://linkedin.com)

🚀 **Happy Deploying!**
