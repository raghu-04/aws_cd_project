terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">= 5.0"
        }
    }
}

#--- ECR REPOSITORY PER SERVICENAME ---
resource "aws_ecr_repository" "svc" {
    for_each = toset(var.services)
    name     = "${var.ecr_namespace}/${each.value}"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
    encryption_configuration {
        encryption_type = "KMS"
    }
}

#Image Lifecycle (keeps upto latest 20 images)
resource "aws_ecr_lifecycle_policy" "keep_recent" {
    for_each = aws_ecr_repository.svc
    repository = each.value.name
    policy = jsonencode({
        rules = [
            {
                rulePriority = 1
                description = "Keep only the last 20 images"
                selection = {
                    tagStatus = "any"
                    countType = "imageCountMoreThan"
                    countNumber = 20
                }
                action = {
                    type = "expire"
                }
            }
        ]
    })
}

output "ecr_repo_name" {
    value = { for k, r in aws_ecr_repository.svc : k => r.arn }
}