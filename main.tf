
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

variable "secret_name" {
  description = "Secret object name"
  type        = string
}

variable "roles" {
  type = map(map(string))
  default = {
    a = {
      aa   = "123"
      aaaa = "132"
    }
    b = {
      bb  = "bbb"
      bbb = "45645646"
    }
  }
}


locals {
  common_labels  =  {
    "environemnt" = "Prod"
    "costCenter" = "1234"
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-k8s-namespace"
  }
}


resource "kubernetes_secret" "example" {
  metadata {
    name      = "basic-auth-${var.secret_name}"
    namespace = kubernetes_namespace.example.metadata[0].name
    annotations = local.common_labels
  }

  data = {
    username  = var.credentials_name
    password  = var.credentials_password
    stringify = join(";", [for key, value in var.roles : "${key}=${join(";", [for k,v in value : "${k} = ${v}"])}"])
  }

  type = "kubernetes.io/basic-auth"
}
