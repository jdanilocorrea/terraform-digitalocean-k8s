output "kubeconfig" {
  description = "Kubeconfig do cluster (conteúdo sensível). Prefer usar output sensível e armazenar externamente."
  value       = module.k8s.kubeconfig
  sensitive   = true
}

output "cluster_id" {
  value = module.k8s.cluster_id
}
