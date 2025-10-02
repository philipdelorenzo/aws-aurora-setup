# outputs.tf

output "db_cluster_endpoint" {
  description = "The DNS endpoint for the Aurora cluster (writer endpoint)."
  value       = module.aurora.cluster_endpoint
}

output "db_cluster_reader_endpoint" {
  description = "The DNS endpoint for the Aurora cluster reader instances."
  value       = module.aurora.cluster_reader_endpoint
}

output "db_port" {
  description = "The port on which the DB accepts connections."
  value       = module.aurora.cluster_port
}
