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
  project_id = "aitech-good-s17919"
  gcp_region = "asia-northeast1"
}

module "gcp_iam" {
  source     = "./gcp/iam"
  project_id = local.project_id
  gcs_vertex = module.gcp_gcs.gcs_vertex
}

module "gcp_vpc" {
  source     = "./gcp/vpc"
  project_id = local.project_id
  gcp_region = local.gcp_region
}

module "gcp_gcs" {
  source     = "./gcp/gcs"
  project_id = local.project_id
  gcp_region = local.gcp_region
}
