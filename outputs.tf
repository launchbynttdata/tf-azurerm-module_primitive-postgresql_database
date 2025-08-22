// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
output "id" {
  description = "resource group id"
  value       = azurerm_resource_group.resource_group.id
}

output "name" {
  description = "resource group name"
  value       = var.name
}


output "database_endpoint" {
  value       = aws_db_instance.example.endpoint
  description = "Database endpoint"
}

output "database_arn" {
  value       = aws_db_instance.example.arn
  description = "Database ARN"
}

output "security_group_id" {
  value       = aws_security_group.example.id
  description = "Security group ID"
}

output "database_name" {
  description = "The name of the PostgreSQL database"
  value       = module.my_database.db_name
}

output "vpc_id" {
  description = "The ID of the VPC where the database is deployed"
  value       = module.root.vpc_id
}

output "private_subnets" {
  description = "List of private subnet IDs where the database is deployed"
  value       = module.root.private_subnets
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group used by the PostgreSQL database"
  value       = module.postgresql.db_subnet_group_name
}

output "db_instance_address" {
  description = "The hostname of the PostgreSQL database instance"
  value       = module.postgresql.db_instance_address
}

output "database_user" {
  description = "The database user/owner"
  value       = module.my_database.db_owner
}

output "database_host" {
  description = "The hostname or IP address of the PostgreSQL server"
  value       = var.db_host
}

output "database_port" {
  description = "The port PostgreSQL is listening on"
  value       = var.db_port
}

output "db_security_group_id" {
  description = "The ID of the security group associated with the PostgreSQL database"
  value       = module.postgresql.security_group_id
}

output "database_url" {
  description = "Full connection string in PostgreSQL URI format"
  value = format(
    "postgresql://%s:%s@%s:%s/%s",
    var.db_username,
    var.db_password,
    var.db_host,
    var.db_port,
    module.my_database.db_name
  )
  sensitive = true
}