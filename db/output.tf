output "instance_name" {
  value       = google_sql_database_instance.mysql.name
  description = "The instance name for the master instance"
}

output "instance_ip_address" {
  value       = google_sql_database_instance.mysql.ip_address
  description = "The IPv4 address assigned for the master instance"
}

output "private_address" {
  value       = google_sql_database_instance.mysql.private_ip_address
  description = "The private IP address assigned for the master instance"
}

output "instance_first_ip_address" {
  value       = google_sql_database_instance.mysql.first_ip_address
  description = "The first IPv4 address of the addresses assigned for the master instance."
}

output "instance_connection_name" {
  value       = google_sql_database_instance.mysql.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link" {
  value       = google_sql_database_instance.mysql.self_link
  description = "The URI of the master instance"
}