

# Rancher Terraform Base Project

This module provides essential resources and settings for Rancher projects. It enables centralized management of CPU and memory limits for Kubernetes containers, namespaces, and projects.

## Features

- Validation of CPU and memory limits for containers, namespaces, and projects
- Support for Rancher API authentication
- Flexible configuration via variables

## Getting Started

### Prerequisites

- Terraform >= 1.0
- Access to a Rancher API URL
- Rancher Access Key and Secret Key

### Example Usage

```hcl
module "base_rancher_project" {
	source = "./tf-base-rancher-project"

	cluster_api_url                        = "https://rancher.example.com"
	rancher_access_key                     = "your-access-key"
	rancher_secret_key                     = "your-secret-key"
	target_cluster_name                    = "my-cluster"
	projekt_name                           = "my-project"
	container_resource_limit_requests_cpu  = "500m"
	container_resource_limit_limits_cpu    = "1000m"
	container_resource_limit_requests_memory = "128Mi"
	container_resource_limit_limits_memory   = "256Mi"
	# ...other variables as needed
}
```

## Variables

| Name | Description | Type | Example/Default |
|------|-------------|------|-----------------|
| cluster_api_url | Rancher API URL | string | "https://rancher.example.com" |
| rancher_access_key | Rancher Access Key | string | - |
| rancher_secret_key | Rancher Secret Key | string | - |
| target_cluster_name | Target cluster name | string | "my-cluster" |
| projekt_name | Project name | string | "my-project" |
| container_resource_limit_requests_cpu | Container CPU request | string/null | "500m" |
| container_resource_limit_limits_cpu | Container CPU limit | string/null | "1000m" |
| container_resource_limit_requests_memory | Container memory request | string/null | "128Mi" |
| container_resource_limit_limits_memory | Container memory limit | string/null | "256Mi" |
| ... | ...see `variables.tf` for more variables | | |

**Note:**  
CPU values must be either `null` or a positive value like `"500m"` or `"1"`.  
Memory values must be either `null` or in the format `<number>Mi` between `50Mi` and `9999Mi`.

## Build and Test

```bash
terraform init
terraform plan
terraform apply
```

## Contribute

Pull requests and issues are welcome! Please make sure your changes are tested.