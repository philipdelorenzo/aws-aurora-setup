module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 9.0" # Use a specific version

  # Cluster Configuration
  name            = "${var.environment}-cluster"
  engine          = "aurora-postgresql"
  engine_version  = var.engine_version # Choose your desired version
  database_name   = var.DB_NAME
  master_username = var.DB_USERNAME
  master_password = var.DB_PASSWORD
  vpc_id          = var.vpc_id
  subnets         = var.subnets

  # DB Instance Configuration
  # db.r7g.large | db.t4g.medium | db.t3.small
  instance_class = var.instance_class # Choose an appropriate instance class 
  instances = {
    # This creates the primary (writer) instance
    one = {}
    # To add a read replica, uncomment the following:
    two = {}
  }

  # Backup and Maintenance
  skip_final_snapshot = true
  #backup_retention_period = 7
  #preferred_maintenance_window = "mon:03:00-mon:04:00"

  # Encryption (Recommended for Production)
  storage_encrypted = false
}
