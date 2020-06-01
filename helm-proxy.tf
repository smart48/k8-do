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

# resource "helm_release" "postgres_proxy" {
#   depends_on = [digitalocean_kubernetes_cluster.kubernetes, helm_release.letsencrypt_issuer]
#   count      = var.helm_enabled ? length(var.postgres_instances) : 0

#   name       = var.postgres_instances[count.index]
#   namespace  = "db-proxy"
#   repository = "https://kubernetes-charts.storage.googleapis.com/"
#   chart      = "socat-tunneller"
#   version    = local.socat_tunneler_version
#   wait       = false

#   set {
#     name  = "tunnel.host"
#     value = digitalocean_database_cluster.postgres[count.index].private_host
#   }

#   set {
#     name  = "tunnel.port"
#     value = digitalocean_database_cluster.postgres[count.index].port
#   }
# }

resource "helm_release" "mysql_proxy" {
  depends_on = [digitalocean_kubernetes_cluster.kubernetes]
  count      = var.helm_enabled ? length(var.mysql_instances) : 0

  name       = var.mysql_instances[count.index]
  namespace  = "db-proxy"
  repository = "https://kubernetes-charts.storage.googleapis.com/"
  chart      = "socat-tunneller"
  version    = local.socat_tunneler_version
  wait       = false

  set {
    name  = "tunnel.host"
    value = digitalocean_database_cluster.mysql[count.index].private_host
  }

  set {
    name  = "tunnel.port"
    value = digitalocean_database_cluster.mysql[count.index].port
  }
}
