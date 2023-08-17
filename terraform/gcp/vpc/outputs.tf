output "ml_network_id" {
  value = google_compute_network.ml_network.id
}

output "ml_network_subnet_id" {
  value = google_compute_subnetwork.ml_network_subnet.id
}
