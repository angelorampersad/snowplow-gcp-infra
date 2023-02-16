provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
	source = "./modules/network"
  project_id = var.project_id
	region = var.region
}

module "iglu" {
	source = "./modules/iglu"
  project_id = var.project_id
	region = var.region

  prefix = var.prefix
  network = "terraform-network"
  subnetwork = "terraform-private"
  ssh_ip_allowlist = var.ssh_ip_allowlist
  ssh_key_pairs = var.ssh_key_pairs
  iglu_db_name = var.iglu_db_name
  iglu_db_username = var.iglu_db_username
  iglu_db_password = var.iglu_db_password
  iglu_super_api_key = var.iglu_super_api_key
  user_provided_id = var.user_provided_id
  telemetry_enabled = var.telemetry_enabled
  ssl_information = var.ssl_information
  labels = var.labels

  depends_on = [module.network]
}

module "pipeline" {
	source = "./modules/pipeline"
  project_id = var.project_id
	region = var.region

  prefix = var.prefix
  network = "terraform-network"
  subnetwork = "terraform-private"
  ssh_ip_allowlist = var.ssh_ip_allowlist
  ssh_key_pairs = var.ssh_key_pairs
  iglu_server_dns_name = join("", ["http://", module.iglu.iglu_server_ip_address])
  iglu_super_api_key = var.iglu_super_api_key
  bigquery_db_enabled = var.bigquery_db_enabled
  bigquery_loader_dead_letter_bucket_deploy = var.bigquery_loader_dead_letter_bucket_deploy
  bigquery_loader_dead_letter_bucket_name = var.bigquery_loader_dead_letter_bucket_name
  user_provided_id = var.user_provided_id
  telemetry_enabled = var.telemetry_enabled
  ssl_information = var.ssl_information
  labels = var.labels

  depends_on = [module.iglu]
}