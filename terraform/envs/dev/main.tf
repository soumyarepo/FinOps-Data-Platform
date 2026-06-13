module "vpc" {
  source       = "../../modules/vpc"
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = "10.20.0.0/16"
}

module "ecr" {
  source       = "../../modules/ecr"
  project_name = var.project_name
  services     = ["account-service", "transaction-service", "loan-service", "fraud-service"]
}

module "eks" {
  source             = "../../modules/eks"
  project_name       = var.project_name
  environment        = var.environment
  private_subnet_ids = module.vpc.public_subnet_ids
}

module "s3" {
  source       = "../../modules/s3"
  project_name = var.project_name
  environment  = var.environment
}

module "glue" {
  source       = "../../modules/glue"
  project_name = var.project_name
  environment  = var.environment
  data_bucket  = module.s3.bucket_name
}

# module "emr" {
#  source       = "../../modules/emr"
#  project_name = var.project_name
#  environment  = var.environment
#  subnet_id    = module.vpc.private_subnet_ids[0]
#  log_bucket   = module.s3.bucket_name
#}

# module "redshift" {
#  source          = "../../modules/redshift"
#  project_name    = var.project_name
#  environment     = var.environment
#  subnet_ids      = module.vpc.private_subnet_ids
#  vpc_id          = module.vpc.vpc_id
#  master_username = "adminuser"
#  master_password = "ChangeMe12345!"
#}
