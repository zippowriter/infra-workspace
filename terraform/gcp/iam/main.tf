resource "google_service_account" "vertex_account" {
  account_id = "vertex-account"
}

resource "google_project_iam_member" "vertex_account_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.vertex_account.email}"
}

resource "google_storage_bucket_iam_member" "vertex_gcs_bucket_writer" {
  bucket = var.gcs_vertex
  role   = "roles/storage.legacyBucketWriter"
  member = "serviceAccount:${google_service_account.vertex_account.email}"
}

resource "google_storage_bucket_iam_member" "vertex_gcs_object_viewer" {
  bucket = var.gcs_vertex
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.vertex_account.email}"
}
