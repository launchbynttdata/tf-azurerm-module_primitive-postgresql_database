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

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  type        = map(string)
  default     = {}
}

variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object({
    name       = string
    max_length = optional(number, 60)
    region     = optional(string, "eastus2")
  }))

  default = {
    rg = {
      name = "rg"
    }
    postgresql_server = {
      name = "server"
    }
    db = {
      name = "db"
    }
  }
}

variable "resource_names_strategy" {
  type        = string
  description = "Strategy to use for generating resource names, taken from the outputs of the naming module, e.g. 'standard', 'minimal_random_suffix', 'dns_compliant_standard', etc."
  nullable    = false
  default     = "minimal_random_suffix"
}

variable "logical_product_family" {
  type        = string
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  nullable    = false
  default     = "launch"

  validation {
    condition     = can(regex("^[A-Za-z0-9_]+$", var.logical_product_family))
    error_message = "logical_product_family may only contain letters, numbers, and underscores"
  }
}

variable "logical_product_service" {
  type        = string
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  nullable    = false
  default     = "example"

  validation {
    condition     = can(regex("^[A-Za-z0-9_]+$", var.logical_product_service))
    error_message = "logical_product_service may only contain letters, numbers, and underscores"
  }
}

variable "class_env" {
  type        = string
  description = "(Required) Environment where resource is going to be deployed. For example: dev, qa, uat"
  nullable    = false
  default     = "sandbox"

  validation {
    condition     = can(regex("^[A-Za-z0-9_]+$", var.class_env))
    error_message = "class_env may only contain letters, numbers, and underscores"
  }
}

variable "instance_env" {
  type        = number
  description = "Number that represents the instance of the environment."
  nullable    = false
  default     = 0

  validation {
    condition     = var.instance_env >= 0 && var.instance_env <= 999
    error_message = "instance_env must be between 0 and 999, inclusive."
  }
}

variable "instance_resource" {
  type        = number
  description = "Number that represents the instance of the resource."
  nullable    = false
  default     = 0

  validation {
    condition     = var.instance_resource >= 0 && var.instance_resource <= 100
    error_message = "instance_resource must be between 0 and 100, inclusive."
  }
}

variable "sku_name" {
  description = "The SKU name for the PostgreSQL"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "The storage size in MB for the PostgreSQL. Possible values are '32768', '65536', '131072', '262144', '524288', '1048576', '2097152', '4194304', '8192000'"
  type        = number
  default     = 32768

  validation {
    condition     = contains([32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8192000], var.storage_mb)
    error_message = "storage_mb must be one of the following values: 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8192000"
  }
}

variable "postgres_version" {
  description = "The PostgreSQL version to use. Possible values include: '11', '12', '13', '14', '15', '16'"
  type        = string
  default     = "16"
  validation {
    condition     = contains(["11", "12", "13", "14", "15", "16"], var.postgres_version)
    error_message = "postgres_version must be one of the following values: '11', '12', '13', '14', '15', '16'"
  }
}
