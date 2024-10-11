# Terraform Multi Tier Deployment

### Project: Deploy a full-scale production-ready multi-tier application.
This setup covers the essential components for a 3-tier architecture with EC2 instances for frontend and backend layers, an RDS database, and VPC networking. 

Components:
- Frontend Layer: Web servers (Auto Scaling EC2 instances) behind an ALB.
- Application Layer: Separate EC2 instances running backend services (Microservices, APIs, etc.).
- Database Layer: Managed database service (RDS/Aurora or DynamoDB).
- VPC Networking: Public, private, and database subnets with appropriate routing and security groups.
- Route53: Use DNS for domain name setup.
- Bastion Host: For secure access to backend servers.
- Monitoring and Logging: Integrate CloudWatch for logs and metrics.

### Terraform files:
1. provider.tf : This file defines the AWS provider and necessary configurations.
2. variable.tf : This file defines all the variables for the project.
3. vpc.tf : This file sets up the VPC, subnets, and routing.
4. web.tf : This file configures the frontend tier with EC2 Auto Scaling and an Application Load Balancer (ALB).
5. backend.tf : This file contains the EC2 backend service layer.
6. database.tf : This file sets up the database layer using RDS.
7. output.tf : This file outputs important information like DNS names.
8. secrets for AWS credentials : AWS credentials are typically stored in ~/.aws/credentials or managed via environment variables.

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
