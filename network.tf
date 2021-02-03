resource "google_compute_network" "mcm_network" {
  name = "${var.network}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "mcm_network_subnetwork" {
  name          = "${var.network}-subnetwork-${var.subnetwork-region}"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.mcm_network.self_link}"
  depends_on = ["google_compute_network.mcm_network"]
  region        = "${var.subnetwork-region}"
}
