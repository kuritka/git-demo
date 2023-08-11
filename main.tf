
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-platform"
}

variable "credentials_name" {
  description = "secret name"
  type        = string
  sensitive   = true
}

variable "credentials_password" {
  description = "secret password"
  type        = string
  sensitive   = true
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-k8s-namespace"
  }
}


resource "kubernetes_secret" "example" {
  metadata {
    name      = "basic-auth"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  data = {
    username = var.credentials_name
    password = var.credentials_password
  }

  type = "kubernetes.io/basic-auth"
}
