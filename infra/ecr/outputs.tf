output "ecr_repo_urls" {
    value = { for k, r in aws_ecr_repository.svc : k => r.repository_url }
}