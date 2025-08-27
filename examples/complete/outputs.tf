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
output "resource_group_name" {
  description = "resource group name"
  value       = module.resource_names["rg"][var.resource_names_strategy]
}

output "database_name" {
  description = "The ID of the Azure PostgreSQL Flexible Server Database"
  value       = module.resource_names["db"][var.resource_names_strategy]
}

output "server_name" {
  description = "The name of the Azure PostgreSQL Flexible Server"
  value       = module.resource_names["postgresql_server"][var.resource_names_strategy]
}
