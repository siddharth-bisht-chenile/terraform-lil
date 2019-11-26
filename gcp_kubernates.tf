resource "google_container_cluster" "k8s" {
  name = "k8s"
  location = "asia-south1-a"
  initial_node_count = 1
#  network = "${google_compute_network.ll-network.self_link}"
    
  master_auth {
    password = "password-16-or-more-characters"
    username = "username"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
