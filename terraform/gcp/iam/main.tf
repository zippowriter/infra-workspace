resource "google_service_account" "vertex_account" {
  account_id = "vertex-account"
  project    = var.project_id
}

resource "google_service_account_iam_member" "vertex_account_admin" {
  service_account_id = google_service_account.vertex_account.name
  role               = "roles/aiplatform.admin"
  member             = "serviceAccount:${google_service_account.vertex_account.email}"
}
