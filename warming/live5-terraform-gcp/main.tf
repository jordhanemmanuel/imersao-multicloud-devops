terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~> 4.37.0"
      }
    }
}

provider "google" {
    project = var.gcp_project_id
}

#gke - google kubernetes engine
resource "google_container_cluster" "primary" {
    name = "kubernetes-aquecimento"
    location = var.gcp_region
    initial_node_count = 1
    enable_autopilot = true
    ip_allocation_policy {
      
    }
}

#google cloud sql to communicate with gke
resource "google_sql_database_instance" "instance" {
    name = "cloudsql-aquecimento"
    region = var.gcp_region
    database_version = "MYSQL_8_0"
    settings {
        tier = "db-f1-micro"
    }

    deletion_protection = "true"
}

resource "google_sql_database" "database" {
    name = "db-rh"
    instance = google_sql_database_instance.instance.name #refence resource above like a class.method call
}