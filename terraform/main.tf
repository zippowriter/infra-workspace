terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

resource "google_storage_bucket" "tfstate" {
  name     = "aitech-good-tfstate"
  location = "ASIA-NORTHEAST1"
}
