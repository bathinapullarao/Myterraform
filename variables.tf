variable "region" {
  default = "us-central1" # Oregon
}

variable "zone" {
  default = "us-central1-c"
}

variable "project-name" {
  default = "terrafrom-244109"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "/usr/local/terraform/demo/terrafrom-e0ebf51e8988.json"
}

variable "gcm" {
  default = {
   "1"    = "dev-mcm-web"
   "2"    = "dev-mcm-app"
   "3"    = "dev-mcm-db"
 }
}


variable "subnetwork-region" {
  default = "us-central1"
}

variable "network" {
  default = "mcm-network"
}

variable "vm_type" {
  default = {
   "micro"    = "f1-micro"
   "small"    = "g1-small"
   "standard" = "n1-standard-2"
  }
}

variable "os" {
  default = {
    "centos7"         = "centos-7-v20170816"
    "debian9"         = "debian-9-stretch-v20170816"
    "ubuntu-1604-lts" = "ubuntu-1604-xenial-v20170815a"
  }
 }
