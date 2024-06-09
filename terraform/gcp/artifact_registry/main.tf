resource "google_artifact_registry_repository" "containers" {
  repository_id = "pipelines"
  format        = "KFP"
  location      = var.gcp_region
  description   = "kfp pipelines' templates"
  project       = var.project_id
}
