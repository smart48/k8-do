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

provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}

provider "helm" {
  # install_tiller = false
  # max_history    = 20
  kubernetes {
    config_context = var.kubernetes_context != "" ? var.kubernetes_context : var.name
  }
}

locals {
  nginx_ingress_version      = "1.26.2"
  cert_manager_version       = "0.11.0"
  socat_tunneler_version     = "0.1.0"
}
