# Terraform Snowplow Playground

## Requirements
The requirements to set up the Snowplow playground:
- [GCP Project & Billing Account](https://cloud.google.com/)
    - [Compute Engine API enabled](https://console.cloud.google.com/apis/api/compute.googleapis.com)
    - [Cloud Resource Manager API enabled](https://console.cloud.google.com/apis/api/cloudresourcemanager.googleapis.com)
    - [Identity and Access Management (IAM) API enabled](https://console.cloud.google.com/apis/api/iam.googleapis.com)
    - [Cloud Pub/Sub API enabled](https://console.cloud.google.com/apis/api/pubsub.googleapis.com)
    - [Cloud SQL Admin API enabled](https://console.cloud.google.com/apis/api/sqladmin.googleapis.com)
    - [Service Account + JSON key created](https://console.cloud.google.com/iam-admin/serviceaccounts)
- [Terraform Cloud Acount](https://cloud.hashicorp.com/products/terraform)

## Get started
Run the application either from the command-line using the `terraform` CLI utility or run the application from Terraform Cloud (connected to your Git repository).

### Running Locally
1. Make sure you set your GCP service-account credentials in your environment:
``` bash
export GOOGLE_APPLICATION_CREDENTIALS="PATH/TO/KEY.json"
```

2. Make sure you update the file `terraform.tfvars` with your application details:
    - GCP project ID
    - SSH IP allowlist
    - SSH key-pair
    - Iglu Database name (up to you)
    - Iglu Database user and pass (up to you)
    - Iglu secret key (up to you)

3. Set up infrastructure:
```bash
terraform init &&
terraform plan &&
terraform apply -auto-approve
```

4. Retrieve the `collector_ip_address` (http) from the console output and start sending Snowplow data.

### Running with Terraform Cloud
1. Create a [Terraform Cloud](https://app.terraform.io/app) workspace and connect your repository.

2. Make sure you set your GCP service-account credentials as
`GOOGLE_CREDENTIALS` environment variable ([single-line JSON](https://medium.com/interleap/automating-terraform-deployment-to-google-cloud-with-github-actions-17516c4fb2e5#:~:text=Open%20the%20file%20with%20vim)). Terraform Cloud will use this credentials for the `google` provider.

3. Make sure you update the Terraform variables to match `terraform.tfvars`, in addition to your:
    - GCP project ID
    - SSH IP allowlist
    - SSH key-pair
    - Iglu Database name (up to you)
    - Iglu Database user and pass (up to you)
    - Iglu secret key (up to you)

3. Optional: Configure Terraform Cloud to auto-approve.

4. Manually trigger Terraform workflow or simply push to your Git repository.

5. Retrieve the `collector_ip_address` (http) from the workflow output and start sending Snowplow data.