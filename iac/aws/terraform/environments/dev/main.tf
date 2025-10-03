provider "aws" {
  region  = var.REGION
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket = "${var.project}-terraform-state"
    # If you hav e multiple environments, consider using a different key for each
    # e.g., "dev/terraform.tfstate", "prod/terraform.tfstate" --> "${var.project}/${var.environment}/terraform.tfstate"
    key     = "${var.project}/terraform.tfstate"
    profile = var.profile
    region  = var.REGION
  }
}

module "aurora_stack" {
  source = "../../"
  # Let's pass the VPC ID from the Data resource.
  vpc_name    = var.vpc_name
  subnet      = var.subnet
  environment = local.environment

  # Database Config
  DB_NAME     = "mydb"                 # Use Doppler or TF_VAR_ to set securely
  DB_USERNAME = "adminuser"            # Use Doppler or TF_VAR_ to set securely
  DB_PASSWORD = "YourSecurePassword1!" # Use Doppler or TF_VAR_ to set securely
  # For the instance count, see the module configuration in modules/aurora/main.tf
  instance_class = local.instance_class # These are defined in locals.tf - per environment
  engine_version = var.engine_version

  common_tags = var.common_tags
}
