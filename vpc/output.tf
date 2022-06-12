output "project_name" {
  value = google_project.team3-gcp-project.name
}

output "project_id" {
  value = google_project.team3-gcp-project.project_id
#   sensitive = false
}

output "vpc_name" {
  value = google_compute_network.vpcglobal.name
}

output "firewall_name" {
  value = google_compute_firewall.allow-http.name
}

output "network_name" {
  value = google_compute_firewall.allow-http.network
}