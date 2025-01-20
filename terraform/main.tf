terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
    }
  }
}

provider "google" {
  project = "terraform-demo-448207"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-demo-448207-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
  
}