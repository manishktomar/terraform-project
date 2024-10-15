# Terraform Secrets

1. Environment Variables (Recommended for AWS Credentials)
2. Terraform Variables (Sensitive Type)
3. AWS Secrets Manager
4. Vault (HashiCorp Vault)


### 1. Environment Variables (Recommended for AWS Credentials)
- You can store sensitive data like AWS credentials in environment variables and have Terraform automatically pick them up.
    ```
    export AWS_ACCESS_KEY_ID=your_access_key
    export AWS_SECRET_ACCESS_KEY=your_secret_key
    ```

### 2. Terraform Variables (Sensitive Type)
- When you need to pass sensitive data into your Terraform configuration, use sensitive variables. The sensitive flag ensures that the value is masked in Terraform's output.
    ```
    variable "db_password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
    }

    resource "aws_db_instance" "example" {
    ...
    password = var.db_password
    }
    ```

### 3. AWS Secrets Manager
- AWS Secrets Manager is a service to securely store and retrieve credentials. Terraform can pull secrets directly from AWS Secrets Manager.
    ```
    data "aws_secretsmanager_secret_version" "example" {
    secret_id = "your-secret-id"
    }

    resource "aws_db_instance" "example" {
    ...
    password = data.aws_secretsmanager_secret_version.example.secret_string
    }
    ```
### 4. Vault (HashiCorp Vault)
- Advanced secret management and access control, HashiCorp Vault can be integrated with Terraform to manage secrets securely.
    ```
    provider "vault" {
    address = "https://vault.yourdomain.com"
    }

    data "vault_generic_secret" "aws" {
    path = "secret/aws"
    }

    resource "aws_instance" "example" {
    access_key = data.vault_generic_secret.aws.data["access_key"]
    secret_key = data.vault_generic_secret.aws.data["secret_key"]
    }
    ```
