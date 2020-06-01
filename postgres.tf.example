/**
 * Copyright 2019 Taito United
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "digitalocean_database_cluster" "postgres" {
  count      = length(var.postgres_instances)

  name       = var.postgres_instances[count.index]
  engine     = "pg"
  version    = "11" # TODO: configurable
  size       = var.postgres_node_sizes[count.index]
  region     = var.region
  node_count = var.postgres_node_counts[count.index]

  lifecycle {
    prevent_destroy = true
  }
}
