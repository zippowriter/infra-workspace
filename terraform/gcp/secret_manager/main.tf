resource "google_secret_manager_regional_secret" "google_generative_ai_api_key" {
  project   = var.project_id
  location  = var.gcp_region
  secret_id = "google-generative-ai-api-key"

  labels = {
    label = "llm"
  }
}
