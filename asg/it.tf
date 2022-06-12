# This block of code creates a static IP address
resource "google_compute_address" "static" {
  name = var.asg_config["static_name"]
}
# This block of code builds instance template(launch template)
resource "google_compute_instance_template" "launch_template" {
  name                    = var.asg_config["instance_template_name"]
  machine_type            = var.asg_config["machine_type"]
  can_ip_forward          = false
  metadata_startup_script = file("userdata.sh") # To install & start a web server on the instances
  metadata = {
    ssh-keys = "centos7:${file("~/.ssh/id_rsa.pub")}"
  }
  disk {
    source_image = var.asg_config["source_image"]
  }
  network_interface {
    network = data.terraform_remote_state.vpcglobal.outputs.vpc_name
     access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}

# This block of code builds firewall for the instances
resource "google_compute_firewall" "wordpress" {
  name    = var.asg_config["firewall_name"]
  network = data.terraform_remote_state.vpcglobal.outputs.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
#   source_tags   = [var.asg_config["network_tags"]]
  source_ranges = ["0.0.0.0/0"]
}