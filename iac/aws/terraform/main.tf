# root/main.tf (Calling the module)
module "network" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet      = var.subnet
  environment = var.environment

  common_tags = var.common_tags
}

module "aurora" {
  source = "./modules/aurora"
  # Prefer an explicit vpc_id var when provided (useful for CI or tests). Otherwise use the network module's output.
  vpc_id      = var.vpc_id != "" ? var.vpc_id : module.network.vpc_id
  subnets     = module.network.aurora_subnet_ids
  environment = var.environment
  # Database Config
  DB_NAME        = var.DB_NAME
  DB_USERNAME    = var.DB_USERNAME
  DB_PASSWORD    = var.DB_PASSWORD
  instance_class = var.instance_class
  engine_version = var.engine_version

  common_tags = var.common_tags
}
