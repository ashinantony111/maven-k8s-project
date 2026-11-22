Maven Web Application Deployment on Amazon EKS using Jenkins CI/CD

1. Project Overview

This project demonstrates the deployment of a Maven-based Java web application to Amazon Elastic Kubernetes Service (EKS) using Jenkins, Docker, Kubernetes and AWS.

The objective is to automate the application build and deployment process using CI/CD practices.

Jenkins is used to automate source code checkout, Maven build and Docker image creation. The Docker image is pushed to Docker Hub and deployed to an Amazon EKS cluster using Kubernetes manifests.

AWS IAM permissions are configured to allow the Jenkins EC2 instance to securely communicate with AWS services through AWS CLI.

2. Architecture

        GitHub Repository
               |
               v
        Jenkins Server
          (AWS EC2)
               |
               v
          Maven Build
               |
               v
        WAR Application
               |
               v
         Docker Build
               |
               v
          Docker Hub
       (Image Registry)
               |
               v
          Amazon EKS
        (Kubernetes)
               |
               v
       Kubernetes Deployment
          (2 Replicas)
               |
               v
       Kubernetes Service
         (LoadBalancer)
               |
               v
         Web Application

AWS IAM Integration:

The Jenkins EC2 instance uses an attached IAM role to obtain temporary AWS credentials. AWS CLI and kubectl are configured to communicate with the EKS cluster.

3. Technologies Used

Technology| Purpose
AWS EC2| Hosts Jenkins
AWS IAM| Authentication and permissions
Amazon EKS| Managed Kubernetes cluster
AWS CLI| AWS resource management
eksctl| EKS cluster management
kubectl| Kubernetes resource management
Ubuntu Linux| Operating system
Jenkins| CI/CD automation
Git & GitHub| Source code management
Apache Maven| Java application build
Docker| Application containerization
Docker Hub| Container image registry
Apache Tomcat| Java web application server
Kubernetes| Container orchestration

4. Project Implementation

Step 1: Jenkins Server Setup

- Created an Ubuntu EC2 instance in AWS.
- Installed Java 21.
- Installed and configured Jenkins.
- Installed Git, Maven and Docker.
- Configured Jenkins tools and required plugins.

Step 2: Maven Build

- Checked out the Java web application source code from GitHub.
- Used Maven to build the application.
- Executed the following command:

mvn clean package

- Generated the WAR artifact:

target/maven-web-app.war

Step 3: Docker Containerization

Created a Dockerfile using Apache Tomcat as the base image.

The Dockerfile performs the following operations:

- Uses the Tomcat base image.
- Exposes port 8080.
- Copies the generated WAR file into the Tomcat webapps directory.

Docker build command:

docker build -t ashinantony/mavenwebapp:latest .

Step 4: Docker Hub Integration

- Built the application Docker image.
- Authenticated with Docker Hub.
- Pushed the Docker image to the Docker Hub repository.

Commands:

docker login
docker images
docker push ashinantony/mavenwebapp:latest

Docker Hub was used as the container image registry, allowing Kubernetes worker nodes to retrieve the application image.

Step 5: AWS IAM Configuration

Configured AWS IAM permissions to enable Jenkins to communicate with AWS services.

Implementation:

1. Created an IAM role with the required AWS permissions.
2. Attached the IAM role to the Jenkins EC2 instance.
3. Installed and configured AWS CLI.
4. Verified AWS authentication using:

aws sts get-caller-identity

5. Configured EKS cluster access for the IAM role.
6. Updated the Kubernetes configuration:

aws eks update-kubeconfig \
--region ap-south-1 \
--name maven-eks-cluster

7. Verified Kubernetes connectivity:

kubectl get nodes

Step 6: Amazon EKS Cluster Creation

Created an Amazon EKS cluster in the Mumbai region (ap-south-1).

Used eksctl to create the cluster and provision the worker node group.

eksctl create cluster \
--name maven-eks-cluster \
--region ap-south-1 \
--nodegroup-name worker-nodes \
--node-type t3.small \
--nodes 1 \
--nodes-min 1 \
--nodes-max 1

Verified the cluster and worker nodes:

eksctl get cluster --region ap-south-1

kubectl get nodes

Step 7: Kubernetes Deployment

Created Kubernetes Deployment and Service resources using "k8s-deploy.yml".

Deployment configuration:

- Deployment name: mavenwebappdeployment
- Replicas: 2
- Container name: mavenwebappcontainer
- Container image: ashinantony/mavenwebapp:latest
- Container port: 8080
- Deployment strategy: Recreate

Service configuration:

- Service name: mavenwebappsvc
- Service type: LoadBalancer
- Service port: 80
- Target port: 8080

Applied the Kubernetes configuration:

kubectl apply -f k8s-deploy.yml

Verified deployment:

kubectl get deployments

kubectl get pods

kubectl get services

Checked application logs:

kubectl logs POD_NAME

The LoadBalancer service exposes the application externally through an AWS load balancer.

5. Jenkins Pipeline

The project includes Jenkins pipeline definitions for automating application build and deployment tasks.

The pipeline implementation covers:

- GitHub source code checkout.
- Maven application build.
- Docker image creation.
- Kubernetes deployment.

Docker Hub image publishing was also performed as part of the deployment workflow.

6. Kubernetes Configuration

The Kubernetes manifest contains two resources:

Deployment

- Maintains two application replicas.
- Uses the Docker Hub application image.
- Runs the application on container port 8080.
- Uses the Recreate deployment strategy.

Service

- Uses LoadBalancer service type.
- Exposes port 80.
- Forwards traffic to container port 8080.

7. Screenshots

Amazon EKS Cluster

screenshots/1.eks-cluster.png

Kubernetes Worker Nodes

screenshots/2.kubernetes-nodes.png

Jenkins CI/CD Pipeline

screenshots/3.jenkins-pipeline.png

Kubernetes Deployment

screenshots/4.kubernetes-deployment.png

Running Application

screenshots/5.application.png

8. Challenges Faced

- Configuring IAM permissions for Jenkins EC2.
- Establishing secure communication between Jenkins and Amazon EKS.
- Configuring AWS CLI and Kubernetes access.
- Managing Docker permissions for the Jenkins user.
- Building and pushing Docker images to Docker Hub.
- Configuring Kubernetes Deployment and Service resources.
- Verifying application accessibility through AWS LoadBalancer.

9. Project Outcome

Successfully deployed a Maven-based Java web application to Amazon EKS using Jenkins, Maven, Docker and Kubernetes.

The project provided practical experience in CI/CD concepts, containerization, AWS IAM integration, Kubernetes orchestration and cloud-based application deployment.

10. Author

Ashin Antony

GitHub: https://github.com/ashinantony111

Portfolio: https://ashinantony.com