resource "google_service_account" "vertex_account" {
  account_id = "vertex-account"
}

resource "google_project_iam_member" "vertex_account_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.vertex_account.email}"
}
