terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}
//Use the Linode Provider
provider "linode" {
  token = var.token
}

resource "linode_lke_cluster" "my-cluster" {
    label       = "my-cluster"
    k8s_version = "1.25"
    region      = "us-central"
    tags        = ["prod"]

    pool {
        type  = "g6-standard-1"
        count = 2
    }
}
