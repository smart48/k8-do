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

/* Labeling */

variable "name" {
  type        = string
  description = "Name that groups all the created resources together. Preferably globally unique to avoid naming conflicts."
}

/* DO provider */

variable "do_token" {
  type        = string
  description = "Digital Ocean personal access token."
}

variable "spaces_access_id" {
  type        = string
  description = "Digital Ocean Spaces access id."
}

variable "spaces_secret_key" {
  type        = string
  description = "Digital Ocean Spaces secret key."
}

variable "region" {
  type = string
  description = "Digital Ocean region."
}

/* Settings */

variable "email" {
  type        = string
  description = "Email address for DevOps support."
}

/* Buckets */

variable "state_bucket" {
  type        = string
  default     = ""
  description = "Name of storage bucket used for storing remote Terraform state."
}

/* Helm */

variable "helm_enabled" {
  type        = bool
  default     = "false"
  description = "Installs helm apps if set to true. Should be set to true only after Kubernetes cluster already exists."
}

variable "helm_nginx_ingress_classes" {
  type    = list(string)
  default = []
  description = "NGINX ingress class for each NGINX ingress installation. Provide multiple if you want to install multiple NGINX ingresses."
}

variable "helm_nginx_ingress_replica_counts" {
  type    = list(string)
  default = []
  description = "Replica count for each NGINX ingress installation. Provide multiple if you want to install multiple NGINX ingresses."
}

/* Kubernetes */

variable "kubernetes_name" {
  type = string
  default = ""
  description = "Name for the Kubernetes cluster."
}

variable "kubernetes_context" {
  type        = string
  default     = ""
  description = "Kubernetes context. Value of var.name is used by default."
}

variable "kubernetes_version" {
  type        = string
  default     = ""
  description = "Kubernetes version"
}

variable "kubernetes_node_size" {
  type        = string
  default     = "s-2vcpu-2gb"
  description = "Size of Kubernetes nodes."
}

# variable "kubernetes_node_count" {
#   type = number
#   default = 1
#   description = "Amount of Kubernetes nodes."
# }

variable "kubernetes_autoscale" {
  type        = bool
  default     = "false"
  description = "Autoscaling on or off."
}
variable "kubernetes_min_nodes" {
  type        = number
  default     = 1
  description = "Minimum number of nodes."
}

variable "kubernetes_max_nodes" {
  type        = number
  default     = 3
  description = "maximum number of nodes."
}

variable "kubernetes_registry_name" {
  type        = string
  default     = "Smart48"
  description = "container registry name."
}

variable "kubernetes_registry_tier" {
  type        = string
  default     = "basic"
  description = "container registry tier."
}

/* Postgres */

variable "postgres_instances" {
  type    = list(string)
  default = []
  description = "Name for each PostgreSQL cluster. Provide multiple if you require multiple PostgreSQL clusters."
}

variable "postgres_node_sizes" {
  type    = list(string)
  default = []
  description = "Node dize for each PostgreSQL cluster. Provide multiple if you require multiple clusters."
}

variable "postgres_node_counts" {
  type    = list(string)
  default = []
  description = "Node count for each PostgreSQL cluster. Provide multiple if you require multiple clusters."
}

/* MySQL */

variable "mysql_version" {
  type    = string
  default = ""
  description = "MySQL Version"
}

variable "mysql_instances" {
  type    = list(string)
  default = []
  description = "Name for each MySQL cluster. Provide multiple if you require multiple clusters."
}

variable "mysql_node_sizes" {
  type    = list(string)
  default = []
  description = "Node size for each MySQL cluster. Provide multiple if you require multiple clusters."
}

variable "mysql_node_counts" {
  type    = list(string)
  default = []
  description = "Node count for each MySQL cluster. Provide multiple if you require multiple clusters."
}


/* Redis */


variable "redis_version" {
  type    = string
  default = ""
  description = "Redis Version"
}

variable "redis_instances" {
  type    = list(string)
  default = []
  description = "Name for each Redis cluster. Provide multiple if you require multiple PostgreSQL clusters."
}

variable "redis_node_sizes" {
  type    = list(string)
  default = []
  description = "Node size for each Redis cluster. Provide multiple if you require multiple clusters."
}

variable "redis_node_counts" {
  type    = list(string)
  default = []
  description = "Node count for each Redis cluster. Provide multiple if you require multiple clusters."
}