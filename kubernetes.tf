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

 # https://github.com/TaitoUnited/terraform-digitalocean-kubernetes-infrastructure

resource "digitalocean_kubernetes_cluster" "kubernetes" {
  count   = var.kubernetes_name != "" ? 1 : 0

  name    = var.kubernetes_name
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name       = "worker-pool"
    size       = var.kubernetes_node_size
    # node_count = var.kubernetes_node_count
    auto_scale = var.kubernetes_autoscale
    min_nodes  = var.kubernetes_min_nodes
    max_nodes  = var.kubernetes_max_nodes
  }

  lifecycle {
    prevent_destroy = true
  }
}
