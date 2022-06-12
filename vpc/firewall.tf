resource "google_compute_firewall" "allow-http" {
  name    = var.firewall_name
  network = google_compute_network.vpcglobal.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "3306"]
  }
  source_tags = var.network_tags
}