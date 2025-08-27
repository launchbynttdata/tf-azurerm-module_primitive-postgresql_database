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

variable "name" {
  description = "The name of the database"
  type        = string
}

variable "server_id" {
  description = "The ID of the server to associate with the database"
  type        = string

}

variable "collation" {
  description = "The collation setting for the database"
  type        = string
  default     = "en_US.utf8"
}

variable "charset" {
  description = "The character set to use for the database"
  type        = string
  default     = "UTF8"
}
