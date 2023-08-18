# Reference: https://github.com/terraform-linters/tflint
# GCP Reference: https://github.com/terraform-linters/tflint-ruleset-google
# On local to initialize a configuration file for TFLint in your Terraform project: tflint --init
plugin "google" {
  enabled = true
  version = "0.24.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}
#plugin "terraform" {
#  enabled = true
#  preset  = "recommended"
#}
