# with_cake

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_postgresql_server"></a> [postgresql\_server](#module\_postgresql\_server) | terraform.registry.launch.nttdata.com/module_primitive/postgresql_server/azurerm | ~> 1.0 |
| <a name="module_database"></a> [database](#module\_database) | ../.. | n/a |
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.client](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Resource Group. | `map(string)` | `{}` | no |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br/>    name       = string<br/>    max_length = optional(number, 60)<br/>    region     = optional(string, "eastus2")<br/>  }))</pre> | <pre>{<br/>  "db": {<br/>    "name": "db"<br/>  },<br/>  "postgresql_server": {<br/>    "name": "server"<br/>  },<br/>  "rg": {<br/>    "name": "rg"<br/>  }<br/>}</pre> | no |
| <a name="input_resource_names_strategy"></a> [resource\_names\_strategy](#input\_resource\_names\_strategy) | Strategy to use for generating resource names, taken from the outputs of the naming module, e.g. 'standard', 'minimal\_random\_suffix', 'dns\_compliant\_standard', etc. | `string` | `"minimal_random_suffix"` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br/>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br/>    For example, backend, frontend, middleware etc. | `string` | `"example"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | (Required) Environment where resource is going to be deployed. For example: dev, qa, uat | `string` | `"sandbox"` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Number that represents the instance of the environment. | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Number that represents the instance of the resource. | `number` | `0` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the PostgreSQL | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | The storage size in MB for the PostgreSQL. Possible values are '32768', '65536', '131072', '262144', '524288', '1048576', '2097152', '4194304', '8192000' | `number` | `32768` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | The PostgreSQL version to use. Possible values include: '11', '12', '13', '14', '15', '16' | `string` | `"16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | resource group name |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The ID of the Azure PostgreSQL Flexible Server Database |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | The name of the Azure PostgreSQL Flexible Server |
<!-- END_TF_DOCS -->
