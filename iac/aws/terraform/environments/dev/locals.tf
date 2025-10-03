locals {
  environment    = "dev"
  instance_class = "db.t3.small"
  common_tags = merge(
    var.common_tags,
    {
      Environment = "Development"
      Project     = var.project
      ManagedBy   = "Terraform"
    }
  )
}
