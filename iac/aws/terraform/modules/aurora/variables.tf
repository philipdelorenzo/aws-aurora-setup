# variables.tf
variable "vpc_id" {
  description = "The VPC ID where the Aurora cluster will be deployed."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "subnets" {
  description = "The subnets for the Aurora cluster."
  type        = list(string)
}

variable "aurora_family_type" {
  description = "The database version - e.g., postgresql15"
  type        = string
  default     = "aurora-postgresql15"
}

variable "DB_NAME" {
  description = "Name of the database"
  type        = string
}

variable "DB_USERNAME" {
  # This should be provided when the module is used, as TF_VAR_DB_USERNAME - See Doppler
  description = "Master username for the database"
  type        = string
}
variable "DB_PASSWORD" {
  # This should be provided when the module is used, as TF_VAR_DB_PASSWORD - See Doppler
  description = "Password for the database user"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for Aurora instances"
  type        = string
}

variable "engine_version" {
  description = "PostgreSQL version for Aurora"
  type        = string
  default     = "15.4"
}

variable "common_tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
