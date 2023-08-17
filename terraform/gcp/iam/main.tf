resource "google_service_account" "vertex_account" {
  account_id = "vertex-account"
}

resource "google_project_iam_member" "vertex_account_user" {
  service_account_id = google_service_account.vertex_account.name
  role               = "roles/aiplatform.user"
  member             = "serviceAccount:${google_service_account.vertex_account.email}"
}
