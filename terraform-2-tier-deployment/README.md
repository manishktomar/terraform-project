# Terraform 2 Tier Deployment

## Project: Deploy a web and database architecture.
This approach uses web.tf for the web layer (Auto Scaling Group + ALB), database.tf for the database layer (RDS), and vpc.tf for the networking setup. This structure keeps your configuration modular while not requiring Terraform modules.

### Components:
- Web Layer: EC2 instances in an Auto Scaling Group with a Load Balancer (ALB).
- Database Layer: RDS (Relational Database Service) for the database (e.g., MySQL or PostgreSQL).
- Security Groups: Web servers accessible over HTTP/HTTPS, and database layer accessible only by web servers.
- Subnets: Public subnet for web layer and private subnet for database layer.
- Module-based approach: Separate modules for networking, compute (web), and database.

### Terraform files:
1. provider.tf : This file defines the AWS provider and sets the region where the resources will be deployed.
2. variable.tf : This file defines the variables for your Terraform project, including AWS region, instance type, and the secret credentials for AWS.
3. main.tf : This file defines the core resources (VPC, EC2 instance, security groups, and optionally auto-scaling policies).
4. output.tf : Define your outputs, like the ALB DNS and RDS endpoint.
5. vpc.tf : This file contains the networking setup, including VPC, subnets, and internet gateway.
6. web.tf : This file contains the EC2 Auto Scaling Group, Load Balancer, and Security Groups for the web layer.
7. database.tf : This file contains the RDS setup, including the database instance and security groups.
8. AWS Credentials (secrets.tfvars) : Instead of hardcoding your AWS credentials into the variable.tf, create a secrets.tfvars file to store them securely.

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
