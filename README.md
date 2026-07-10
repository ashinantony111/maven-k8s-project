# Maven Web Application Deployment on Amazon EKS using Jenkins CI/CD

## Project Overview

This project demonstrates a complete CI/CD pipeline for deploying a Maven-based Java web application to Amazon Elastic Kubernetes Service (EKS) using Jenkins, Docker, Kubernetes, and GitHub.

The pipeline automates the entire deployment process, including source code checkout, application build, Docker image creation, and Kubernetes deployment.

---

## Architecture

GitHub
   ↓
Jenkins Pipeline
   ↓
Maven Build
   ↓
Docker Image
   ↓
Docker Hub
   ↓
Amazon EKS
   ↓
AWS Load Balancer
   ↓
Web Application

---

## Technologies Used

- AWS EC2
- Amazon EKS
- Kubernetes
- Jenkins
- Git & GitHub
- Apache Maven
- Docker
- Docker Hub
- AWS CLI
- kubectl
- eksctl
- Ubuntu Linux

---

## Pipeline Workflow

1. Clone source code from GitHub
2. Build the application using Maven
3. Build Docker image
4. Push Docker image to Docker Hub
5. Deploy application to Amazon EKS
6. Expose application using Kubernetes Service
7. Access application through AWS Load Balancer

---

## Project Structure

```text
.
├── Dockerfile
├── Jenkinsfile
├── k8s-deploy.yml
├── pom.xml
├── src/
└── README.md
```

---

## Jenkins Pipeline Stages

- Tool Installation
- Clone Repository
- Maven Build
- Docker Image Build
- Kubernetes Deployment

---

# Screenshots

## Amazon EKS Cluster

screenshots/1.eks-cluster.png

---

## Kubernetes Worker Nodes

screenshots/2.kubernetes-nodes.png

---

## Jenkins CI/CD Pipeline

screenshots/3.jenkins-pipeline.png

---

## Kubernetes Deployment

screenshots/4.kubernetes-deployment.png

---

## Application Running

screenshots/5.application.png

---

## Skills Demonstrated

- Jenkins CI/CD Pipeline
- Docker Containerization
- Kubernetes Deployment
- Amazon EKS Administration
- Git & GitHub
- Apache Maven
- AWS EC2
- IAM Configuration
- Docker Hub Integration
- Linux Administration
- AWS CLI
- kubectl
- eksctl

---

## Challenges Faced

- Configuring IAM Roles for AWS services
- Connecting Jenkins to Amazon EKS
- Managing Kubernetes configuration
- Building Docker images through Jenkins
- Deploying applications using Kubernetes manifests
- Verifying application accessibility through AWS Load Balancer

---

## Project Outcome

Successfully implemented a fully automated CI/CD pipeline that deploys a Maven web application from GitHub to Amazon EKS using Jenkins, Docker, and Kubernetes.

---

## Author

**Ashin Antony**

GitHub: https://github.com/ashinantony111
