variable "vpc_name" {
  description = "Name of the existing VPC to use (this will query by the Name tag to find the VPC ID)"
  type        = string
}

variable "subnet" {
  description = "The subnet CIDR block for the Aurora cluster."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

# Database Config
variable "engine_version" {
  description = "Engine (PostgreSQL) version for Aurora"
  type        = string
  default     = "15.4"
}

variable "DB_NAME" {
  description = "Name of the initial database to create"
  type        = string
}

variable "DB_USERNAME" {
  description = "Master username for the database"
  type        = string
}

variable "DB_PASSWORD" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for the Aurora instances"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
