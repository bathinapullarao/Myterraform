resource "google_compute_instance" "gcm_web" {
  name         = "${var.gcm.1}"
  machine_type = "${var.vm_type["micro"]}"
 boot_disk {
    initialize_params {
      image = "${var.os["centos7"]}"
    }
  }
 metadata_startup_script = "sudo yum update -y; sudo yum install -yq nginx;sudo yum enable nginx; sudo systemctl start nginx"
  network_interface {
# A default network is created for all GCP projects
  subnetwork = "${google_compute_subnetwork.gcm_network_subnetwork.name}"
    access_config {
     }
   }
   metadata = {
   ssh-keys = "pullarao:${file("/home/pullarao/.ssh/id_rsa.pub")}"
 }
}

resource "google_compute_instance" "gcm_webap" {
  name         = "${var.gcm.2}"
  machine_type = "${var.vm_type["small"]}"
 boot_disk {
    initialize_params {
      image = "${var.os["centos7"]}"
    }
  }
 metadata_startup_script = "sudo yum update -y; sudo yum install -yq httpd;sudo yum enable httpd; sudo systemctl start httpd"
  network_interface {
# A default network is created for all GCP projects
  subnetwork = "${google_compute_subnetwork.gcm_network_subnetwork.name}"
    access_config {
     }
   }
   metadata = {
   ssh-keys = "pullarao:${file("/home/pullarao/.ssh/id_rsa.pub")}"
 }
}


resource "google_compute_instance" "gcm_db" {
  name         = "${var.gcm.3}"
  machine_type = "${var.vm_type["standard"]}"
 boot_disk {
    initialize_params {
      image = "${var.os["centos7"]}"
    }
  }
 metadata_startup_script = "sudo yum update -y; sudo yum install wget -y; sudo wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm; sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm; sudo yum update; sudo yum install mysql-server -y -y; sudo systemctl enable mysqld; sudo systemctl restart mysqld"
  network_interface {
# A default network is created for all GCP projects
  subnetwork = "${google_compute_subnetwork.gcm_network_subnetwork.name}"
    access_config {
     }
   }
   metadata = {
   ssh-keys = "pullarao:${file("/home/pullarao/.ssh/id_rsa.pub")}"
 }
}
