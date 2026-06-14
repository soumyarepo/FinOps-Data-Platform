resource "aws_ecr_repository" "this" {
  for_each = toset(var.services)
  name     = "${var.project_name}/${each.value}"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
