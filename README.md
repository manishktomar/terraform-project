#  What is Terraform?
Terraform is open-source communication as a system software tool created by HashiCorp. It is an instrument for building, altering, and versioning transportation safely and professionally. Terraform can direct existing and accepted service providers as well as convention in-house solutions.


## Project Description:
In this project, I developed a streamlined infrastructure for hosting a static website using Terraform and Amazon Web Services (AWS) S3. The primary goal of this project is to demonstrate the automated provisioning and deployment of a web hosting solution for static websites.

## Prerequisites:

1. Basic knowledge of AWS services and concepts.
2. Familiarity with Terraform and infrastructure as code principles.
3. An AWS account with appropriate permissions.
4. An IDE of your Choice , I would suggest VS Code Editor .
5. This project serves as an excellent foundation for hosting various types of static websites, including personal blogs, portfolio sites, or small business websites.

## Commands for Terraform :

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
