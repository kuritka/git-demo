
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-platform"
}

variable "credentials_name" {
  description = "secret name"
  type        = string
}

variable "credentials_password" {
  description = "secret password"
  type        = string
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-k8s-namespace"
  }
}
