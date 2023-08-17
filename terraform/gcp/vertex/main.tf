resource "google_notebooks_instance" "ml_experiment" {
  name     = "ml-experiment"
  location = "${var.gcp_region}-a"

  vm_image {
    project    = "deeplearning-platform-release"
    image_name = "tf-ent-2-11-cu113-notebooks-v20230807-debian-11-py310"
  }

  machine_type = "n1-standard-4"
  accelerator_config {
    type       = "NVIDIA_TESLA_T4"
    core_count = 1
  }
  install_gpu_driver = true

  boot_disk_type    = "PD_BALANCED"
  boot_disk_size_gb = 100
  data_disk_type    = "PD_BALANCED"
  data_disk_size_gb = 100

  network = var.network
  subnet  = var.subnet

  service_account = var.service_account
}
