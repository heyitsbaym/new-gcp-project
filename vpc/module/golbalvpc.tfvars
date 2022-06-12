module "vpc" {
  source        = "../"
  billing_acct  = "My Billing Account"
  project_name  = "testmodule"
  vpc_name      = "vpcglobal"
  region        = "us-central1"
  zone          = "us-central1-c"
  firewall_name = "fw-allow-http"
  network_tags  = ["webserver"]
  labels        = {
    name        = "vpc_global"
    env         = "dev"
    team        = "devops_gcp"
  }
}

output "vpc_name" {
  value = module.vpc.vpc_name 
  sensitive = true
}

output "project_id" {
    value = module.vpc.project_id
    sensitive = true
}