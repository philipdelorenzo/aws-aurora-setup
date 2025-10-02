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
  source     = "../../"
  project    = var.project
  network_id = var.network_id
  vpc_cidr   = var.vpc_cidr
}
