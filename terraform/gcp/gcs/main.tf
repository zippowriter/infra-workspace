resource "google_storage_bucket" "vertex" {
  name     = "${var.project_id}-vertex"
  project  = var.project_id
  location = var.gcp_region
}
