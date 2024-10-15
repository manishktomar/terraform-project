# HashiCorp Vault Setup

### 1. To install Vault on the EC2 instance, you can use the following steps:
    ```
    sudo apt update && sudo apt install gpg
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    ```

    ```
    sudo apt install vault
    ```

### 2. Start Vault
    ```
    vault server -dev -dev-listen-address="0.0.0.0:8200"
    ```

### 3. Configure Terraform to read the secret from Vault.
- Enable AppRole Authentication:
    ```
    vault auth enable approle
    ```

- Create an AppRole:
    ```
    vault policy write terraform - <<EOF
    path "*" {
    capabilities = ["list", "read"]
    }

    path "secrets/data/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
    }

    path "kv/data/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
    }


    path "secret/data/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
    }

    path "auth/token/create" {
    capabilities = ["create", "read", "update", "list"]
    }
    EOF
    ```

- Create the AppRole
Now you'll need to create an AppRole with appropriate policies and configure its authentication settings.
    ```
    vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform
    ```

### 4. Generate Role ID and Secret ID:
After creating the AppRole, you need to generate a Role ID and Secret ID pair. The Role ID is a static identifier, while the Secret ID is a dynamic credential.

- Generate Role ID:
    ```
    vault read auth/approle/role/my-approle/role-id
    ```

- Generate Secret ID:
    ```
    vault write -f auth/approle/role/my-approle/secret-id
    ```
