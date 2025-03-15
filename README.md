# 🚀 Node.js Kubernetes CI/CD Pipeline on AWS EKS

This project automates the deployment of a **Node.js application** to **AWS EKS (Elastic Kubernetes Service)** using **GitHub Actions CI/CD**.

## 🛠 Features
✅ **Infrastructure as Code (IaC)** using Terraform to provision AWS resources
✅ **AWS EKS** cluster setup with worker nodes and networking configuration
✅ **GitHub Actions** for automated CI/CD pipeline
✅ **Dockerized Node.js app** with AWS ECR (Elastic Container Registry)
✅ **Auto-deployment** to Kubernetes upon code push
✅ **AWS LoadBalancer** for external access

---

## 🏗 Architecture
1. **Terraform** provisions:
   - VPC, Subnets, Security Groups
   - EKS Cluster & Managed Node Group
   - IAM Roles & Policies
   - AWS ECR for storing container images
2. **GitHub Actions CI/CD**:
   - Builds and pushes Docker image to **AWS ECR**
   - Deploys the latest image to **Kubernetes on AWS EKS**
   - Updates Kubernetes deployment using `kubectl`
3. **AWS LoadBalancer** exposes the application

---

## 🚀 Deployment Flow
1️⃣ **Push code to GitHub** → Triggers CI/CD
2️⃣ **GitHub Actions** builds & pushes Docker image to **AWS ECR**
3️⃣ **Kubernetes Deployment** updates the running application
4️⃣ **Access the app via AWS LoadBalancer**

---

## 🏗 Setup & Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/nodejs-eks-cicd.git
cd nodejs-eks-cicd
```

### 2️⃣ Deploy AWS Infrastructure with Terraform
```bash
cd terraform
terraform init
terraform apply -auto-approve
```

### 3️⃣ Verify Kubernetes Cluster
```bash
aws eks --region ap-south-1 update-kubeconfig --name my-eks-cluster
kubectl get nodes
```

---

## 🛠 Technologies Used
- **AWS EKS** (Elastic Kubernetes Service)
- **AWS ECR** (Elastic Container Registry)
- **Terraform** (Infrastructure as Code)
- **GitHub Actions** (CI/CD Pipeline)
- **Docker** (Containerization)
- **Kubernetes** (Orchestration)

---

🚀 **Happy Deploying!**
