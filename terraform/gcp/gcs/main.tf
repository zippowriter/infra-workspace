resource "google_storage_bucket" "vertex" {
  name     = "vertex"
  project  = var.project_id
  location = var.gcp_region
}
