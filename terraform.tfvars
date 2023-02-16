
# Will be prefixed to all resource names
# Use this to easily identify the resources created and provide entropy for subsequent environments
prefix = "sp"

# The project to deploy the infrastructure into
project_id = "[GCP_PROJECT]"

# Where to deploy the infrastructure
region = "europe-west3"

# --- Default Network
# Update to the network you would like to deploy into
#
# Note: If you opt to use your own network then you will need to define a subnetwork to deploy into as well
network    = "terraform-network"
subnetwork = "terraform-private"

# --- SSH
# Update this to your IP Address
ssh_ip_allowlist = ["[CIDR_IP_RANGE]", "[CIDR_IP_RANGE]"]
# Generate a new SSH key locally with `ssh-keygen`
# ssh-keygen -t rsa -b 4096 
ssh_key_pairs = [
  {
    user_name  = "[USER_NAME]"
    public_key = "[SSH_PUBLIC_KEY]"
  }
]

# --- Snowplow Iglu Server
iglu_db_name     = "[DB_NAME]"
iglu_db_username = "[DB_USER_NAME]"
# Change and keep this secret!
iglu_db_password = "[DB_PASSWORD]"

# Used for API actions on the Iglu Server
# Change this to a new UUID and keep it secret!
iglu_super_api_key = "[SECRET_UUID]"

# NOTE: To push schemas to your Iglu Server, you can use igluctl
# igluctl: https://docs.snowplowanalytics.com/docs/pipeline-components-and-applications/iglu/igluctl
# igluctl static push --public schemas/ http://CHANGE-TO-MY-IGLU-IP SECRET_UUID

# --- Snowplow BigQuery Loader
bigquery_db_enabled = true
# To use an existing bucket set this to false
bigquery_loader_dead_letter_bucket_deploy = true
# Must be globally unique so will need to be updated before applying
bigquery_loader_dead_letter_bucket_name = "sp-bq-loader-dead-letter"

# See for more information: https://github.com/snowplow-devops/terraform-google-iglu-server-ce#telemetry
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

