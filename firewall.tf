resource "google_compute_firewall" "allow-mgmt" {
  name    = "allow-mgmt"
  network = "${google_compute_network.gcm_network.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// Adding GCP Firewall Rules for INBOUND
resource "google_compute_firewall" "allow-inbound" {
  name    = "allow-inbound"
  network = "${google_compute_network.gcm_network.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// Adding GCP Firewall Rules for OUTBOUND
resource "google_compute_firewall" "allow-outbound" {
  name    = "allow-outbound"
  network = "${google_compute_network.gcm_network.self_link}"

  allow {
    protocol = "all"
   # ports    = ["all"]
  }

  source_ranges = ["0.0.0.0/0"]
}
