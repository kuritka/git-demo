# GitHub DEM⭕

## Terraform provider
details: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs


- clone project
- userB: create branch BKS-AAA-userB-update README.md
- userB: update REAMDE.md
- userB: PR

- userA: git pull
- create branch BKS-XYZ-userA-create-secret
- create branch BKS-XWZ-userB-update README.md
 - XYZ: implement secret
 - XYZ: implement secret
 - XYZ: implement secret

 - XWZ: immplement README
 - XWZ: make PR
 - XWZ: --amend change
 - XWZ: make PR

 - XYZ: Squash commit 
 - XYZ: rebase 
 - XYZ: make PR 

todo:
 git reset --hard XXXX

Optionally: git stash, merge conflicts 

```shell
resource "kubernetes_secret" "example" {
  metadata {
    name = "basic-auth"
  }

  data = {
    username = "admin"
    password = "P4ssw0rd"
  }

  type = "kubernetes.io/basic-auth"
}
```


