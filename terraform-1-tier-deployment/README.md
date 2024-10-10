# Terraform 1 Tier Deployment

## Project: Deploy a simple web application on a single EC2 instance.
This setup will create a basic 1-tier architecture with an EC2 instance, VPC, subnet, security groups, and optionally (auto-scaling). The provisioner will install Apache on the EC2 instance so that you can serve a simple web page.

### Components:
- EC2 instance: Single server for web application.
- Security Groups: Allow HTTP/HTTPS traffic.
- VPC: Basic VPC setup with subnets, internet gateway, and route tables.
- Provisioning: Use Terraform provisioners to install Apache/Nginx.
- Auto Scaling: Optional addition of scaling policies to automatically handle traffic surges.

### Terraform files:
1. provider.tf : This file defines the AWS provider and sets the region where the resources will be deployed.
2. variable.tf : This file defines the variables for your Terraform project, including AWS region, instance type, and the secret credentials for AWS.
3. main.tf : This file defines the core resources (VPC, EC2 instance, security groups, and optionally auto-scaling policies).
4. output.tf : 
5. AWS Credentials (secrets.tfvars) : Instead of hardcoding your AWS credentials into the variable.tf, create a secrets.tfvars file to store them securely.

## Running the Project

1. Initialize your Terraform project:
```
terraform init
```

2. Validate the configuration:
```
terraform validate
```

3. Apply the configuration:
Load the secrets with the following command during the terraform apply stage:
```
terraform apply -var-file="secrets.tfvars"
```
