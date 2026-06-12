output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ecr_repositories" {
  value = module.ecr.repository_urls
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "redshift_endpoint" {
  value = module.redshift.endpoint
}
