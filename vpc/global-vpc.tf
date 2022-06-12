# Create Global VPC
resource "google_compute_network" "vpcglobal" {
  name                    = var.vpc_name
  auto_create_subnetworks = "true"
  routing_mode            = "GLOBAL"
  
}