# Will be prefixed to all resource names
# Use this to easily identify the resources created and provide entropy for subsequent environments
prefix = "sp"

# The project to deploy the infrastructure into
project_id = "[GCP_PROJECT_ID]"

# Where to deploy the infrastructure
region = "[GCP_REGION]"

# --- Default Network
# Update to the network you would like to deploy into
#
# Note: If you opt to use your own network then you will need to define a subnetwork to deploy into as well
network    = "default"
subnetwork = ""

# --- SSH
# Update this to your IP Address
ssh_ip_allowlist = ["127.0.0.0/8"]
# Generate a new SSH key locally with `ssh-keygen`
# ssh-keygen -t rsa -b 4096 
ssh_key_pairs = [
  {
    user_name  = "[SSH_USERNAME]"
    public_key = "[SSH_PUBLIC_KEY]"
  }
]

# --- Iglu Server Configuration
# Iglu Server DNS output from the Iglu Server stack
iglu_server_dns_name = "[IGLU_URL]"
# Used for API actions on the Iglu Server
# Change this to the same UUID from when you created the Iglu Server
iglu_super_api_key = "[SECRET_UUID]"

# --- Snowplow BigQuery Loader
bigquery_db_enabled = true
# To use an existing bucket set this to false
bigquery_loader_dead_letter_bucket_deploy = true
# Must be globally unique so will need to be updated before applying
bigquery_loader_dead_letter_bucket_name = "sp-bq-loader-dead-letter"

# See for more information: https://registry.terraform.io/modules/snowplow-devops/collector-pubsub-ce/google/latest#telemetry
# Telemetry principles: https://docs.snowplowanalytics.com/docs/open-source-quick-start/what-is-the-quick-start-for-open-source/telemetry-principles/
user_provided_id  = ""
telemetry_enabled = false

# --- SSL Configuration (optional)
ssl_information = {
  certificate_id = ""
  enabled        = false
}

# --- Extra Labels to append to created resources (optional)
labels = {}

