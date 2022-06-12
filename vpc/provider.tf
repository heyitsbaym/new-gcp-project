# Provide region and zone information for our resource
provider "google" {
  region = var.region
  zone   = var.zone
}