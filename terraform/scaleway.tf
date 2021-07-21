terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.1.0"
    }
  }

  backend "remote" {
    organization = "softwarebybear"

    workspaces {
      name = "GitOps"
    }
  }
}

provider "scaleway" {
  project_id = "23f6e5f6-cf00-40fc-b6a6-ff8071cc36bb"
  region     = "nl-ams"
  zone       = "nl-ams-1"
}

resource "scaleway_k8s_cluster" "captain" {
  name    = "captain"
  version = "1.21.1"
  cni     = "cilium"
  tags    = ["gitops", "testing"]
}

resource "scaleway_k8s_pool" "crew" {
  cluster_id  = scaleway_k8s_cluster.captain.id
  name        = "crew"
  node_type   = "DEV1-M"
  size        = 1
  autohealing = true
  tags        = ["gitops", "testing"]
}
