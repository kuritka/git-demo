# GitHub DEM⭕

## Terraform provider
details: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
link to presentation: https://docs.google.com/presentation/d/1NYNGrSskE2lPTYKnqfjh7uaQHhxaKVBLqdWzl0XA72k/edit?usp=sharing

```.env
TF_VAR_credentials_name="user"
TF_VAR_credentials_password="Pa$$w0rd"
```

```shell
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
```


