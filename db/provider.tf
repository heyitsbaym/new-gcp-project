provider "google-beta" {
  region = var.region
  zone   = var.zone
  project = data.terraform_remote_state.vpcglobal.outputs.project_id
}