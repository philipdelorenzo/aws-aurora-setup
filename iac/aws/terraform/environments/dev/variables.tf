variable "project" {
  description = "Name of the project"
  type        = string
}

variable "vpc_name" {
  description = "The name of the existing VPC to use (this will query by the Name tag to find the VPC ID)"
  type        = string
}

variable "engine_version" {
  description = "Engine (PostgreSQL) version for Aurora"
  type        = string
  default     = "15.4"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "REGION" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "subnet" {
  description = "CIDR block for Aurora database subnet"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
