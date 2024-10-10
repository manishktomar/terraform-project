#  Terraform
Terraform is open-source communication as a system software tool created by HashiCorp. It is an instrument for building, altering, and versioning transportation safely and professionally. Terraform can direct existing and accepted service providers as well as convention in-house solutions.

- Terraform 1 Tier Deployment [Project](./terraform-1-tier-deployment)
- Terraform 2 Tier Deployment [Project](./terraform-2-tier-deployment)
- Terraform Multi Tier Deployment [Project](./terraform-multi-tier-deployment)
- Terraform Module Deployment [Project](./terraform-module-project)
- Terraform Secret 
- Terraform Basic Commands 

## 1. Terraform 1 Tier Deployment
#### Project: Deploy a simple web application on a single EC2 instance.
Components:
- EC2 instance: Single server for web application.
- Security Groups: Allow HTTP/HTTPS traffic.
- VPC: Basic VPC setup with subnets, internet gateway, and route tables.
- Provisioning: Use Terraform provisioners to install Apache/Nginx.
- Auto Scaling: Optional addition of scaling policies to automatically handle traffic surges.


## 2. Terraform 2 Tier Deployment
#### Project: Deploy a web and database architecture.
Components:
- Web Layer: EC2 instances in an Auto Scaling Group with a Load Balancer (ALB).
- Database Layer: RDS (Relational Database Service) for the database (e.g., MySQL or PostgreSQL).
- Security Groups: Web servers accessible over HTTP/HTTPS, and database layer accessible only by web servers.
- Subnets: Public subnet for web layer and private subnet for database layer.
- Module-based approach: Separate modules for networking, compute (web), and database.


## 3. Terraform Multi Tier Deployment
#### Project: Deploy a full-scale production-ready multi-tier application.
Components:
- Frontend Layer: Web servers (Auto Scaling EC2 instances) behind an ALB.
- Application Layer: Separate EC2 instances running backend services (Microservices, APIs, etc.).
- Database Layer: Managed database service (RDS/Aurora or DynamoDB).
- VPC Networking: Public, private, and database subnets with appropriate routing and security groups.
- Route53: Use DNS for domain name setup.
- Bastion Host: For secure access to backend servers.
- Monitoring and Logging: Integrate CloudWatch for logs and metrics.


## 4. Terraform Module Deployment
#### Project: Create reusable Terraform modules for each component in the infrastructure
Components:
- VPC Module: Define networking, subnets, gateways, and route tables.
- EC2 Module: Reusable module for launching EC2 instances with different AMIs or configurations.
- RDS Module: Separate module for managing RDS instances.
- ALB Module: Manage Application Load Balancer configuration.
- Security Module: A module that manages reusable security groups.
- S3 Module: Store files or static content for the app.
- IAM Module: Manage IAM roles, policies, and users.
- Terraform Remote State: Set up remote state management using AWS S3/DynamoDB to manage shared state files.


## 5. Terraform Secret
1. secrets.tfvars
    ```
    aws_access_key = "YOUR_AWS_ACCESS_KEY"
    aws_secret_key = "YOUR_AWS_SECRET_KEY"
    db_password = "YOUR_DB_PASSWORD"
    ```
    Load the secrets with the following command during the terraform apply stage:
    ```
    terraform apply -var-file="secrets.tfvars"
    ```

## Terraform Basic Commands:

### Step 1: Initializing Terraform 

Shows terraform version installed
```
$ terraform –version			
```
Prepare your working dir
```
$ terraform init				
```
Upgrade Terraform
```
$ terraform init -upgrade 		
```
Downloads and update modules mentioned in the root module
```
$ terraform get					
```
Modules already downloaded will be checked for updates and updated
```
$ terraform get -update=true	
```

### Step 2: Switch Working Directory

```
$ terraform -chdir=”../dev” apply
```

### Step 3: Log In and Out to a Remote Host (Terraform Cloud)

Grab an API token for Terraform cloud (app.terraform.io) using your browser.
```
$ terraform login	
```
Log in to a specified host.
```
$ terraform login <hostname>
```
Remove the credentials that are stored locally after logging in, by default for Terraform Cloud (app.terraform.io).
```
$ terraform logout	
```
Remove the credentials that are stored locally after logging in for the specified hostname.
```
$ terraform logout <hostname>	
```

Marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply
```
$ terraform taint aws_instance.my_ec2		
```
unmarks a Terraform-managed resource as tainted
```
$ terraform untaint aws_instance.my_ec2		
```

### Step 4: Format and validate Terraform Code

Format your Terraform configuration files using the HCL language standard.
```
$ terraform fmt	
```
Also format files in subdirectories
```
$ terraform fmt --recursive	
```

### Step 6: Provision infrastructure

Validate configuration files for syntax
```
$ terraform validate	
```

Creates an execution plan (dry run)
```
$ terraform plan	
```
$ terraform validate	validate configuration files for syntax
Executes changes to the actual environment
```
$ terraform apply	
```
Apply changes without being prompted to enter ”yes”
```
$ terraform apply –auto-approve	
```

Destroy/cleanup without being prompted to enter ”yes”
```
$ terraform destroy –auto-approve	
```
Only destroy the targeted resource and its dependencies
```
$ terraform destroy -target	
```
