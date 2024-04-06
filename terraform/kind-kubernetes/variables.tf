variable "cluster_name" {
  description = "The kind cluster name."
  default     = "test-cluster2"
  type        = string
}

variable "kind_version" {
  description = "The kind version of kubernetes."
  default     = "v1.27.1"
  type        = string
}

variable "install_nginx" {
  description = "Whether to install the nginx Helm chart"
  type        = bool
  default     = false
}

