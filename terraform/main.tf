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

resource "google_storage_bucket" "tf_state" {
  name     = "aitech-good-tfstate"
  location = "asia-northeast1"
}

terraform {
  backend "gcs" {
    bucket = "aitech-good-tfstate"
    prefix = "tfstate"
  }
}
