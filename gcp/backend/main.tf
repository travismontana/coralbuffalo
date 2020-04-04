provider "google" {
  project = "coralbuffalo"
  region = "us-central1"
}

resource "google_storage_bucket" "tf-state-prod" {
  name = "state_prod"
  versioning {
    enabled = true
  }
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:wookie@coralbuffalo.iam.gserviceaccount.com",
    ]
  }
}

resource "google_storage_bucket_iam_policy" "policy" {
  bucket = google_storage_bucket.tf-state-prod.name
  policy_data = data.google_iam_policy.admin.policy_data
}
