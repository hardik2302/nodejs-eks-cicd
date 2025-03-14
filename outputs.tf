output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app_repo.repository_url
}
