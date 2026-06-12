resource "aws_redshift_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-redshift-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "redshift" {
  name        = "${var.project_name}-${var.environment}-redshift-sg"
  description = "Security group for Redshift cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_redshift_cluster" "this" {
  cluster_identifier        = "${var.project_name}-${var.environment}-redshift"
  database_name             = "finopsdb"
  master_username           = var.master_username
  master_password           = var.master_password
  node_type                 = "dc2.large"
  cluster_type              = "single-node"
  publicly_accessible       = false
  skip_final_snapshot       = true
  cluster_subnet_group_name = aws_redshift_subnet_group.this.name
  vpc_security_group_ids    = [aws_security_group.redshift.id]
}
