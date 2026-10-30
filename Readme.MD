# Portalwiz – Infrastructure Automation and CI/CD Deployment on AWS

A complete Cloud and DevOps project demonstrating Infrastructure as Code (IaC), containerization, cloud infrastructure provisioning, and automated CI/CD deployment using Terraform, AWS, Docker, Amazon ECR, and Jenkins.

The project implements a three-tier Task Tracker application deployed on AWS EC2, with Amazon RDS MySQL as the database. Terraform is used to provision and manage AWS infrastructure, while Jenkins automates application building, validation, containerization, image publishing, and deployment.

---

# Table of Contents

1. Project Overview
2. Project Objectives
3. Technology Stack
4. System Architecture
5. Terraform – Infrastructure as Code
6. Terraform Project Structure
7. AWS Infrastructure Components
8. Docker Containerization
9. Amazon ECR – Container Registry
10. Application Architecture
11. Jenkins – CI/CD Automation
12. Jenkins Pipeline Stages
13. Deployment Process
14. Application Verification
15. Project Screenshots
16. Security Practices
17. How to Run the Project
18. Future Enhancements
19. Author

---

# 1. Project Overview

Portalwiz is a Cloud and DevOps implementation project that demonstrates how to automate infrastructure provisioning and application deployment using modern DevOps tools.

The project is divided into two major parts:

**Infrastructure Automation**

Terraform is used to provision AWS resources through reusable modules. These modules manage networking, EC2 instances, security groups, IAM permissions, and Amazon ECR.

**Application CI/CD Automation**

The application is containerized using Docker and deployed on AWS EC2. Jenkins automates the complete CI/CD workflow by integrating GitHub, Docker, AWS ECR, and the deployment environment.

Amazon RDS provides managed MySQL database services for persistent application data storage.

# 2. Project Objectives

- Automate AWS infrastructure provisioning using Terraform.
- Implement reusable and modular Terraform configurations.
- Configure VPC, subnets, security groups, and EC2 infrastructure.
- Manage AWS permissions using IAM roles and policies.
- Create and manage Amazon ECR repositories.
- Containerize the application using Docker.
- Integrate GitHub with Jenkins for source code management.
- Implement an automated CI/CD pipeline.
- Push Docker images to Amazon ECR.
- Deploy the application on AWS EC2.
- Connect the application to Amazon RDS MySQL.
- Verify deployment through application health checks.

# 3. Technology Stack

| Category | Technologies |
|---|---|
| Infrastructure as Code | Terraform |
| Cloud Platform | Amazon Web Services |
| Compute | Amazon EC2 |
| Networking | Amazon VPC, Subnets |
| Containerization | Docker |
| Container Registry | Amazon ECR |
| Database | Amazon RDS MySQL |
| CI/CD | Jenkins |
| Version Control | Git, GitHub |
| Backend | Node.js, Express.js |
| Frontend | HTML, CSS, JavaScript |
| Operating System | Ubuntu Linux |
| Container Runtime | Docker |
| Application Runtime | Node.js 22 Alpine |

# 4. System Architecture

The project follows an infrastructure automation and CI/CD architecture.

```text
                 DEVELOPER
                     |
                     |
                  Git Push
                     |
                     v
               GITHUB REPOSITORY
                     |
                     |
                     v
                JENKINS SERVER
                     |
          +----------+-----------+
          |          |           |
          v          v           v
       Checkout   Code        Docker
       Source     Validation  Build
          |          |           |
          +----------+-----------+
                     |
                     v
               AWS ECR LOGIN
                     |
                     v
               PUSH DOCKER IMAGE
                     |
                     v
                AMAZON ECR
                     |
                     v
              EC2 DEPLOYMENT
                     |
                     v
              DOCKER CONTAINER
                     |
                     v
             NODE.JS APPLICATION
                     |
                     v
                AMAZON RDS
                  MYSQL
```

Terraform provisions the AWS infrastructure required by this architecture.

# 5. Terraform – Infrastructure as Code

Terraform is used to automate AWS infrastructure provisioning through Infrastructure as Code (IaC).

Instead of manually creating AWS resources through the AWS Management Console, infrastructure is defined using declarative Terraform configuration files.

The project follows a modular architecture, where different AWS components are managed through separate Terraform modules.

### Terraform Configuration

The root Terraform configuration manages the infrastructure modules and their dependencies.

The main configuration files include:

| File | Purpose |
|---|---|
| `main.tf` | Defines and connects infrastructure modules |
| `provider.tf` | Configures the AWS provider |
| `variable.tf` | Declares input variables |
| `output.tf` | Defines infrastructure outputs |
| `.terraform.lock.hcl` | Locks provider dependency versions |

### Terraform Modules

The project contains five reusable infrastructure modules.

**1. VPC Module**

Responsible for networking infrastructure.

- Creates the AWS Virtual Private Cloud.
- Configures subnet resources.
- Provides network isolation for AWS resources.

**2. EC2 Module**

Responsible for compute infrastructure.

- Provisions EC2 instances.
- Configures instance-related resources.
- Manages instance configuration through Terraform variables.

**3. Security Group Module**

Manages network access permissions.

- Defines inbound traffic rules.
- Defines outbound traffic rules.
- Controls access to application and infrastructure ports.

**4. IAM Module**

Manages AWS identity and access permissions.

- Creates IAM roles and policies.
- Provides permissions required by AWS resources.
- Supports controlled access to AWS services.

**5. ECR Module**

Manages Amazon Elastic Container Registry.

- Creates an ECR repository.
- Provides repository configuration.
- Supports storing and retrieving Docker images.

### Terraform Workflow

The infrastructure provisioning process follows these steps:

**Initialize Terraform**

```bash
terraform init
```

Downloads the required providers and initializes the working directory.

**Validate Configuration**

```bash
terraform validate
```

Checks the Terraform configuration for syntax and structural errors.

**Format Configuration**

```bash
terraform fmt -recursive
```

Formats Terraform files consistently.

**Review Infrastructure Changes**

```bash
terraform plan
```

Displays the infrastructure changes Terraform intends to perform.

**Provision Infrastructure**

```bash
terraform apply
```

Creates or updates the AWS infrastructure after confirmation.

**View Outputs**

```bash
terraform output
```

Displays the configured infrastructure outputs.

**Destroy Infrastructure**

```bash
terraform destroy
```

Destroys resources managed by the Terraform configuration after confirmation. Use this only when the infrastructure is no longer required.

# 6. Terraform Project Structure

```text
Terraform/
│
├── main.tf
├── provider.tf
├── variable.tf
├── output.tf
├── .terraform.lock.hcl
│
└── Modules/
    │
    ├── EC2/
    │   ├── main.tf
    │   ├── variable.tf
    │   └── output.tf
    │
    ├── ECR/
    │   ├── main.tf
    │   ├── variable.tf
    │   └── output.tf
    │
    ├── IAM/
    │   ├── main.tf
    │   ├── variable.tf
    │   └── output.tf
    │
    ├── Security_group/
    │   ├── main.tf
    │   ├── variable.tf
    │   └── output.tf
    │
    └── VPC/
        ├── main.tf
        ├── variable.tf
        └── output.tf
```

The modular structure improves maintainability, reusability, and separation of infrastructure responsibilities.

# 7. AWS Infrastructure Components

The following AWS services are used in the project:

| AWS Service | Implementation |
|---|---|
| Amazon VPC | Provides an isolated network environment |
| Subnets | Organizes resources within the VPC |
| Security Groups | Controls network traffic |
| Amazon EC2 | Hosts Jenkins and the application |
| IAM | Manages access permissions |
| Amazon ECR | Stores container images |
| Amazon RDS | Hosts the MySQL database |

The AWS resources are configured to support application deployment and CI/CD operations.

# 8. Docker – Application Containerization

Docker is used to package the application and its production dependencies into a portable container image.

The project uses a multi-stage Dockerfile based on Node.js Alpine.

### Docker Implementation

The Dockerfile uses two stages:

**Dependencies Stage**

- Uses Node.js 22 Alpine.
- Installs production dependencies using `npm ci --omit=dev`.

**Production Stage**

- Creates the production application image.
- Copies application files and dependencies.
- Uses a non-root Node.js user.
- Exposes port 3000.
- Starts the application using Node.js.

### Build Docker Image

```bash
docker build -t portalwiz:v1 .
```

### Run Docker Container

```bash
docker run -d \
  --name portalwiz \
  --env-file .env \
  -p 3000:3000 \
  portalwiz:v1
```

### Verify Container

```bash
docker ps
```

### View Container Logs

```bash
docker logs portalwiz
```

The application runs inside the Docker container and communicates with Amazon RDS using environment variables.

# 9. Amazon ECR – Container Registry

Amazon Elastic Container Registry (ECR) is used to store Docker images generated during the CI/CD pipeline.

**AWS Region:** `us-east-1`

**Repository Name:** `portalwiz`

**Repository URI:**

```text
170010887450.dkr.ecr.us-east-1.amazonaws.com/portalwiz
```

### ECR Authentication

Jenkins authenticates with ECR using AWS IAM role permissions.

```bash
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin \
170010887450.dkr.ecr.us-east-1.amazonaws.com
```

### Image Tagging

Docker images are tagged using the Jenkins build number and the `latest` tag.

Example:

```text
portalwiz:1
portalwiz:latest
```

### Push Image to ECR

```bash
docker push 170010887450.dkr.ecr.us-east-1.amazonaws.com/portalwiz:1
```

Jenkins performs image tagging and pushing automatically during pipeline execution.

# 10. Application Architecture

Portalwiz uses a three-tier Task Tracker application.

### Presentation Tier

- Developed using HTML, CSS, and JavaScript.
- Provides the user interface.
- Communicates with backend APIs.

### Application Tier

- Developed using Node.js and Express.js.
- Handles application logic and API requests.
- Performs task-related operations.
- Communicates with the database through `db.js`.

### Data Tier

- Uses MySQL as the database.
- Hosted on Amazon RDS.
- Stores application task information persistently.

### Database Configuration

The application connects to RDS through environment variables.

Example configuration:

```env
DB_HOST=your-rds-endpoint
DB_PORT=3306
DB_USER=your-database-username
DB_PASSWORD=your-database-password
DB_NAME=task_tracker
```

Actual credentials are maintained separately on the EC2 instance and are not committed to GitHub.

# 11. Jenkins – CI/CD Automation

Jenkins is used to automate the application's Continuous Integration and Continuous Deployment workflow.

The Jenkins pipeline integrates:

- GitHub for source code management.
- Node.js for dependency installation and code validation.
- Docker for application containerization.
- AWS IAM for secure AWS authentication.
- Amazon ECR for Docker image storage.
- Docker on EC2 for application deployment.

### Jenkins Job Configuration

| Setting | Configuration |
|---|---|
| Job Name | Portalwiz-CI-CD |
| Job Type | Pipeline |
| Pipeline Definition | Pipeline script from SCM |
| Source Control | Git |
| Repository | Portalwiz_Project |
| Branch | `main` |
| Script Path | `Jenkinsfile` |

### Jenkins IAM Configuration

The Jenkins EC2 instance uses an IAM role:

`portalwiz-jenkins-ec2-rolee`

The role has the required ECR permissions to authenticate and push images to the `portalwiz` repository.

This avoids hardcoding AWS access keys inside the Jenkins pipeline.

# 12. Jenkins Pipeline Stages

The CI/CD workflow is implemented through the `Jenkinsfile`.

The pipeline contains eight stages.

### Stage 1 – Checkout

Jenkins retrieves the latest application source code and Jenkinsfile from GitHub.

### Stage 2 – Install Dependencies

Installs Node.js dependencies.

```bash
npm ci
```

### Stage 3 – Code Validation

Performs JavaScript syntax validation.

```bash
npm run lint
```

The validation checks:

```bash
node --check server.js
node --check db.js
```

### Stage 4 – Build Docker Image

Builds a Docker image using the project's Dockerfile.

The image is tagged with the Jenkins build number.

### Stage 5 – Login to AWS ECR

Authenticates Jenkins with Amazon ECR using AWS IAM role permissions.

### Stage 6 – Push Image to ECR

Pushes the generated Docker image to the ECR repository.

Two tags are maintained:

- Jenkins build number
- `latest`

### Stage 7 – Deploy Application

Jenkins performs the deployment on the EC2 instance.

The deployment process:

1. Checks that the environment file is readable.
2. Stops the existing application container.
3. Removes the previous container.
4. Starts a new container using the latest build-specific image.
5. Maps port 3000 from EC2 to port 3000 inside the container.
6. Supplies database configuration through the environment file.

### Stage 8 – Health Check

Jenkins checks whether the application is responding successfully.

```bash
curl --fail http://localhost:3000/health
```

Expected response:

```text
OK
```

A successful response confirms that the application health endpoint is accessible.

# 13. Deployment Process

The application is deployed on an AWS EC2 Ubuntu instance.

The deployment process is automated through Jenkins.

### Deployment Workflow

1. Developer pushes changes to GitHub.
2. Jenkins checks out the source code.
3. Jenkins installs dependencies.
4. JavaScript syntax validation is performed.
5. Docker image is built.
6. Jenkins authenticates with Amazon ECR.
7. The Docker image is pushed to ECR.
8. The previous application container is replaced.
9. The new container is started.
10. Jenkins executes the application health check.

The container is configured with:

```bash
--restart unless-stopped
```

This allows Docker to restart the container after a Docker daemon or instance restart, provided the image is available locally.

# 14. Application Verification

After successful deployment, the application can be accessed through the EC2 public IP.

### Application URL

```text
http://YOUR_EC2_PUBLIC_IP:3000
```

### Health Check URL

```text
http://YOUR_EC2_PUBLIC_IP:3000/health
```

Expected health-check response:

```text
OK
```

### Verify Running Containers

```bash
docker ps
```

### Check Application Logs

```bash
docker logs portalwiz
```

### Verify Jenkins Build

Open the Jenkins dashboard:

1. Select `Portalwiz-CI-CD`.
2. Open the latest build.
3. Select Console Output.
4. Verify that all eight stages completed successfully.

# 15. Project Screenshots

Screenshots of the actual infrastructure configuration, Terraform implementation, Docker deployment, Jenkins execution, and application output are maintained in the `OUTPUT_SCREENSHORTS` directory.

The screenshots provide visual evidence of the implemented project.

```text
OUTPUT_SCREENSHORTS/
```

The directory includes the available project implementation screenshots.

### Screenshot Categories

- Terraform infrastructure configuration.
- AWS VPC and networking resources.
- EC2 instance configuration.
- IAM roles and permissions.
- Amazon ECR repository and Docker images.
- Docker container execution.
- Jenkins pipeline execution.
- Successful deployment.
- Application output.

Refer to the `OUTPUT_SCREENSHORTS` folder in the repository for the actual screenshots.

# 16. Security Practices

The project follows several security practices:

- AWS permissions are managed using IAM roles and policies.
- ECR access is restricted using repository-specific permissions.
- Database credentials are stored in an environment file.
- `.env` is excluded from Git using `.gitignore`.
- `.env` is excluded from the Docker build context using `.dockerignore`.
- Terraform state files are excluded from Git.
- Terraform variable files containing sensitive information are excluded from Git.
- The Docker production container runs as a non-root user.
- RDS access is controlled using security groups.
- Jenkins uses EC2 IAM role authentication instead of hardcoded AWS access keys.

# 17. How to Run the Project

### Prerequisites

Install or configure:

- Terraform
- AWS CLI
- Git
- Docker
- Node.js and npm
- Jenkins
- An AWS account with appropriate permissions

### Step 1 – Clone the Repository

```bash
git clone https://github.com/YashDolare15/Portalwiz_Project.git
```

```bash
cd Portalwiz_Project
```

### Step 2 – Initialize Terraform

```bash
cd Terraform
terraform init
```

### Step 3 – Validate Terraform

```bash
terraform validate
```

### Step 4 – Review and Provision Infrastructure

```bash
terraform plan
terraform apply
```

Provide any required variable values through your local configuration. Do not commit sensitive `.tfvars` files.

### Step 5 – Configure Application

Configure the database environment variables on the deployment EC2 instance.

### Step 6 – Configure Jenkins

Create a Jenkins Pipeline job using the GitHub repository and the `Jenkinsfile`.

### Step 7 – Execute Pipeline

Run the `Portalwiz-CI-CD` job and verify the build output.

### Step 8 – Access Application

Open the EC2 public IP on port 3000.

**Note:** The existing deployment uses Jenkins and Docker on the EC2 host. Terraform infrastructure provisioning and application deployment should be configured according to the resources and variables defined in the Terraform files.




*This project demonstrates practical implementation of Infrastructure as Code, AWS cloud services, Docker containerization, and Jenkins-based CI/CD automation.*
