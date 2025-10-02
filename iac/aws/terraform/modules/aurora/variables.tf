# variables.tf
variable "vpc_id" {
  description = "The ID of the VPC where the Aurora cluster will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "db_security_group_id" {
  description = "The ID of the Security Group to attach to the Aurora cluster."
  type        = string
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

variable "instance_count" {
  description = "Number of Aurora instances"
  type        = number
}
