data "google_billing_account" "acct" {
  display_name = var.billing_acct
  open         = true
}

resource "random_password" "password" {
  length  = 16
  number  = false
  special = false
  lower   = true
  upper   = false
}

resource "google_project" "team3-gcp-project" {
  name            = var.project_name
  project_id      = random_password.password.result
  billing_account = data.google_billing_account.acct.id
  labels          = var.labels
}

# To enable the GCP services
resource "null_resource" "set-project" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "gcloud config set project ${google_project.team3-gcp-project.project_id}"
  }
}

resource "null_resource" "unset-project" {
  provisioner "local-exec" {
    when    = destroy
    command = "gcloud config unset project"
  }
}

# To enable the GCP services
resource "null_resource" "enable-apis" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
        gcloud services enable compute.googleapis.com
        gcloud services enable dns.googleapis.com
        gcloud services enable storage-api.googleapis.com
        gcloud services enable container.googleapis.com
    EOT
  }
}
© 2022 GitHub, Inc.
Terms
