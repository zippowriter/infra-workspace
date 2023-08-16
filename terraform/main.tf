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

terraform {
  backend "gcs" {
    bucket = "aitech-good-tfstate"
    prefix = "tfstate"
  }
}

locals {
  project_id = "aitech-good-S17919"
}

module "gcp_iam" {
  source     = "./gcp/iam"
  project_id = local.project_id
}
