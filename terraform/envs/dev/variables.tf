variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "finops-data-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
