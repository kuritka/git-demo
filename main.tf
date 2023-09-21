

resource "random_integer" "s3" {
  min = 1000
  max = 9999
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
