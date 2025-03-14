resource "aws_ecr_repository" "app_repo" {
  name = "my-app-repo"
  image_tag_mutability = "MUTABLE"
  force_delete = true
}

resource "aws_ecr_lifecycle_policy" "ecr_policy" {
    repository = aws_ecr_repository.app_repo.name
    policy = <<EOF
        {
            "rules": [
                {
                "rulePriority": 1,
                "description": "Expire untagged images older than 14 days",
                "selection": {
                    "tagStatus": "untagged",
                    "countType": "sinceImagePushed",
                    "countUnit": "days",
                    "countNumber": 14
                },
                "action": {
                    "type": "expire"
                }
                }
            ]
        }
        EOF
}