provider "google" {
  project = "coralbuffalo"
  region = "us-central1"
}

terraform {
  backend "gcs" {
    bucket  = "state_prod"
    prefix  = "terraform/state"
  }
}

resource "google_compute_network" "vpc_network" {
  name = "coralbuffalo_vpc"
  description = "Coral Buffalo VPC"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "publicA" {
  name = "publicA"
  ip_cidr_range = "10.1.0.0/16"
  region = "us-central1"
  network = google_compute_network.coralbuffalo.self_link
}
