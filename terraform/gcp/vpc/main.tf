# Vertex, ML実験環境に使用
resource "google_compute_network" "ml_network" {
  project                 = var.project_id
  name                    = "ml-network"
  auto_create_subnetworks = false
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_subnetwork" "ml_network_subnet" {
  name          = "ml-network-subnet"
  ip_cidr_range = "10.2.0.0/26"
  region        = var.gcp_region
  network       = google_compute_network.ml_network.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_firewall" "ml_network_allow_ssh" {
  name      = "ml-network-allow-ssh"
  network   = google_compute_network.ml_network.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
