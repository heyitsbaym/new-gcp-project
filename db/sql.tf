data "terraform_remote_state" "vpcglobal" {
  backend = "gcs"
  config = {
    bucket = "terraform-project-team3"
    prefix = "terraform/state/globalvpc"
  }
}
output "vpcglobal" {
  value = data.terraform_remote_state.vpcglobal.outputs.vpc_name
}
output "project_id" {
  value = data.terraform_remote_state.vpcglobal.outputs.project_id
}

data "terraform_remote_state" "asg" {
  backend = "gcs"
  config = {
    bucket = "terraform-project-team3"
    prefix = "terraform/state/asg"
  }
}

resource "google_sql_database_instance" "mysql" {
  project             = data.terraform_remote_state.vpcglobal.outputs.project_id
  name                = var.name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection
  root_password       = var.root_password

 settings {
    tier              = var.tier
    activation_policy = var.activation_policy
  }
}

resource "google_sql_user" "admin" {
  name     = var.user_name
  instance = google_sql_database_instance.mysql.name
  host     = var.user_host
  password = var.user_password
}

resource "google_sql_database" "cloud-sql" {
  name     = var.db_name
  instance = google_sql_database_instance.mysql.name
}

resource "google_compute_firewall" "allow-mysql" {
  name    = "dbfirewall"
  network = data.terraform_remote_state.vpcglobal.outputs.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  source_ranges = var.allowed_hosts
}

