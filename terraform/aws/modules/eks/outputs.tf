output "configure_kubectl" {
  description = "Configure kubectl"
  value       = <<-EOT
    export KUBECONFIG="/tmp/${module.eks.cluster_name}"
    aws --profile ${local.profile} eks --region ${local.region} update-kubeconfig --name ${module.eks.cluster_name}
  EOT
}

