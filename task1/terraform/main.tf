provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
      http_load_balancing {
          disabled = false
      }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#    service_account = google_service_account.default.email
 #   oauth_scopes    = [
  #    "https://www.googleapis.com/auth/cloud-platform"
   # ]
  }
}

output "cluster_name" {
   value = "${google_container_cluster.primary.name}"
}
