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
