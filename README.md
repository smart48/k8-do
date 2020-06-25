# Kubernetes infrastructure for Digital Ocean

Kubernetes infrastructure module designed to get you up and running in no time. Provides all the necessary components for running your projects: Kubernetes, NGINX ingress, cert-manager, container registry, databases, database proxies, networking, monitoring, and permissions. Use it either as a module, or as an example for your own customized infrastructure.

This module is used by [infrastructure templates](https://taitounited.github.io/taito-cli/templates#infrastructure-templates) of [Taito CLI](https://taitounited.github.io/taito-cli/). See the [do template](https://github.com/TaitoUnited/taito-templates/tree/master/infrastructure/do/terraform) as an example on how to use this module.


## Terraform

To set up Terraform use

```
terraform init
```

Then to test use 

```
terraform plan
```

you should see something like

```
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_database_cluster.mysql[0] will be created
  + resource "digitalocean_database_cluster" "mysql" {
      + database             = (known after apply)
      + engine               = "mysql"
      + host                 = (known after apply)
      + id                   = (known after apply)
      + name                 = "smt1_mysql"
      + node_count           = 1
      + password             = (sensitive value)
      + port                 = (known after apply)
      + private_host         = (known after apply)
      + private_network_uuid = (known after apply)
      + private_uri          = (sensitive value)
      + region               = "ams3"
      + size                 = "db-s-1vcpu-2gb"
      + uri                  = (sensitive value)
      + urn                  = (known after apply)
      + user                 = (known after apply)
      + version              = "8"
    }

  # digitalocean_database_cluster.redis-base[0] will be created
  + resource "digitalocean_database_cluster" "redis-base" {
      + database             = (known after apply)
      + engine               = "redis"
      + host                 = (known after apply)
      + id                   = (known after apply)
      + name                 = "smt1_redis"
      + node_count           = 1
      + password             = (sensitive value)
      + port                 = (known after apply)
      + private_host         = (known after apply)
      + private_network_uuid = (known after apply)
      + private_uri          = (sensitive value)
      + region               = "ams3"
      + size                 = "db-s-1vcpu-2gb"
      + uri                  = (sensitive value)
      + urn                  = (known after apply)
      + user                 = (known after apply)
      + version              = "5"
    }

  # digitalocean_kubernetes_cluster.kubernetes[0] will be created
  + resource "digitalocean_kubernetes_cluster" "kubernetes" {
      + cluster_subnet = (known after apply)
      + created_at     = (known after apply)
      + endpoint       = (known after apply)
      + id             = (known after apply)
      + ipv4_address   = (known after apply)
      + kube_config    = (sensitive value)
      + name           = "smt1"
      + region         = "ams3"
      + service_subnet = (known after apply)
      + status         = (known after apply)
      + updated_at     = (known after apply)
      + version        = "1.17.5-do.0"
      + vpc_uuid       = (known after apply)

      + node_pool {
          + actual_node_count = (known after apply)
          + auto_scale        = true
          + id                = (known after apply)
          + max_nodes         = 2
          + min_nodes         = 1
          + name              = "worker-pool"
          + nodes             = (known after apply)
          + size              = "s-1vcpu-2gb"
        }
    }

  # digitalocean_spaces_bucket.state[0] will be created
  + resource "digitalocean_spaces_bucket" "state" {
      + acl                = "private"
      + bucket_domain_name = (known after apply)
      + force_destroy      = false
      + id                 = (known after apply)
      + name               = "tfstate"
      + region             = "ams3"
      + urn                = (known after apply)
    }

  # helm_release.cert_manager[0] will be created
  + resource "helm_release" "cert_manager" {
      + atomic                     = false
      + chart                      = "cert-manager"
      + cleanup_on_fail            = false
      + create_namespace           = false
      + dependency_update          = false
      + disable_crd_hooks          = false
      + disable_openapi_validation = false
      + disable_webhooks           = false
      + force_update               = false
      + id                         = (known after apply)
      + max_history                = 0
      + metadata                   = (known after apply)
      + name                       = "cert-manager"
      + namespace                  = "cert-manager"
      + recreate_pods              = false
      + render_subchart_notes      = true
      + replace                    = false
      + repository                 = "https://charts.jetstack.io/"
      + reset_values               = false
      + reuse_values               = false
      + skip_crds                  = false
      + status                     = "deployed"
      + timeout                    = 300
      + verify                     = false
      + version                    = "v0.13.0"
      + wait                       = true

      + set {
          + name  = "global.podSecurityPolicy.enabled"
          + value = "false"
        }
      + set {
          + name  = "global.rbac.create"
          + value = "true"
        }
      + set {
          + name  = "securityContext.enabled"
          + value = "true"
        }
      + set {
          + name  = "serviceAccount.create"
          + value = "true"
        }
    }

  # helm_release.cert_manager_crd[0] will be created
  + resource "helm_release" "cert_manager_crd" {
      + atomic                     = false
      + chart                      = "cert-manager-crd"
      + cleanup_on_fail            = false
      + create_namespace           = false
      + dependency_update          = false
      + disable_crd_hooks          = false
      + disable_openapi_validation = false
      + disable_webhooks           = false
      + force_update               = false
      + id                         = (known after apply)
      + max_history                = 0
      + metadata                   = (known after apply)
      + name                       = "cert-manager-crd"
      + namespace                  = "cert-manager-crd"
      + recreate_pods              = false
      + render_subchart_notes      = true
      + replace                    = false
      + repository                 = "https://taitounited.github.io/taito-charts/"
      + reset_values               = false
      + reuse_values               = false
      + skip_crds                  = false
      + status                     = "deployed"
      + timeout                    = 300
      + verify                     = false
      + version                    = "0.13.0"
      + wait                       = true
    }

  # helm_release.letsencrypt_issuer[0] will be created
  + resource "helm_release" "letsencrypt_issuer" {
      + atomic                     = false
      + chart                      = "./letsencrypt-issuer"
      + cleanup_on_fail            = false
      + create_namespace           = false
      + dependency_update          = false
      + disable_crd_hooks          = false
      + disable_openapi_validation = false
      + disable_webhooks           = false
      + force_update               = false
      + id                         = (known after apply)
      + max_history                = 0
      + metadata                   = (known after apply)
      + name                       = "letsencrypt-issuer"
      + namespace                  = "cert-manager"
      + recreate_pods              = false
      + render_subchart_notes      = true
      + replace                    = false
      + reset_values               = false
      + reuse_values               = false
      + skip_crds                  = false
      + status                     = "deployed"
      + timeout                    = 300
      + verify                     = false
      + version                    = "0.1.0"
      + wait                       = true

      + set {
          + name  = "email"
          + value = "jasper@imwz.io"
        }
    }

  # helm_release.mysql_proxy[0] will be created
  + resource "helm_release" "mysql_proxy" {
      + atomic                     = false
      + chart                      = "socat-tunneller"
      + cleanup_on_fail            = false
      + create_namespace           = false
      + dependency_update          = false
      + disable_crd_hooks          = false
      + disable_openapi_validation = false
      + disable_webhooks           = false
      + force_update               = false
      + id                         = (known after apply)
      + max_history                = 0
      + metadata                   = (known after apply)
      + name                       = "smt1_mysql"
      + namespace                  = "db-proxy"
      + recreate_pods              = false
      + render_subchart_notes      = true
      + replace                    = false
      + repository                 = "https://kubernetes-charts.storage.googleapis.com/"
      + reset_values               = false
      + reuse_values               = false
      + skip_crds                  = false
      + status                     = "deployed"
      + timeout                    = 300
      + verify                     = false
      + version                    = "0.1.0"
      + wait                       = false

      + set {
          + name  = "tunnel.host"
          + value = (known after apply)
        }
      + set {
          + name  = "tunnel.port"
          + value = (known after apply)
        }
    }

  # helm_release.nginx_ingress[0] will be created
  + resource "helm_release" "nginx_ingress" {
      + atomic                     = false
      + chart                      = "nginx-ingress"
      + cleanup_on_fail            = false
      + create_namespace           = false
      + dependency_update          = false
      + disable_crd_hooks          = false
      + disable_openapi_validation = false
      + disable_webhooks           = false
      + force_update               = false
      + id                         = (known after apply)
      + max_history                = 0
      + metadata                   = (known after apply)
      + name                       = "nginx-ingress"
      + namespace                  = "nginx-ingress"
      + recreate_pods              = false
      + render_subchart_notes      = true
      + replace                    = false
      + repository                 = "https://kubernetes-charts.storage.googleapis.com/"
      + reset_values               = false
      + reuse_values               = false
      + skip_crds                  = false
      + status                     = "deployed"
      + timeout                    = 300
      + verify                     = false
      + version                    = "1.26.2"
      + wait                       = false

      + set {
          + name  = "controller.ingressClass"
          + value = "nginx-class-1"
        }
      + set {
          + name  = "controller.replicaCount"
          + value = "2"
        }
      + set {
          + name  = "controller.service.externalTrafficPolicy"
          + value = "Local"
        }
      + set {
          + name  = "podSecurityPolicy.enabled"
          + value = "false"
        }
      + set {
          + name  = "rbac.create"
          + value = "true"
        }
      + set {
          + name  = "serviceAccount.create"
          + value = "true"
        }
    }

  # null_resource.cert_manager_crd_wait will be created
  + resource "null_resource" "cert_manager_crd_wait" {
      + id       = (known after apply)
      + triggers = {
          + "cert_manager_version" = "0.13.0"
          + "helm_enabled"         = "true"
        }
    }

Plan: 10 to add, 0 to change, 0 to destroy.
```

## Digital Ocean Kubernetes

To check for sizes you can use `options sizes` with the Digital Ocean command line tool:

```
doctl k8s options sizes
Slug               Name
s-1vcpu-2gb        s-1vcpu-2gb
s-2vcpu-2gb        s-2vcpu-2gb
s-1vcpu-3gb        s-1vcpu-3gb
s-2vcpu-4gb        s-2vcpu-4gb
s-4vcpu-8gb        s-4vcpu-8gb
m-1vcpu-8gb        m-8GB
c-2                c-2-4GiB
g-2vcpu-8gb        g-2vcpu-8gb
.....
```

For regions you can use

```
doctl k8s options regions
Slug Name
nyc1 New York 1
sgp1 Singapore 1
lon1 London 1
nyc3 New York 3
ams3 Amsterdam 3
fra1 Frankfurt 1
tor1 Toronto 1
sfo2 San Francisco 2
blr1 Bangalore 1
sfo3 San Francisco 3
```

We use `ams3`. The region `ams2` is no longer available.

For K8 version do a 

```
doctl k8s options versions
```

and see
```
doctl k8s options versions
Slug            Kubernetes Version
1.17.5-do.0     1.17.5
1.16.8-do.0     1.16.8
1.15.11-do.0    1.15.11
```

We would use `1.17.5-do.0`

## Terraform Helm Nginx Ingress

[source](https://www.terraform.io/docs/providers/kubernetes/r/ingress.html)

example 

```
resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
  }

  spec {
    backend {
      service_name = "MyApp1"
      service_port = 8080
    }

    rule {
      http {
        path {
..
```