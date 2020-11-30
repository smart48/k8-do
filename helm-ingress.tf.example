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
 # https://github.com/jetstack/terraform-google-gke-cluster/issues/37

resource "helm_release" "nginx_ingress" {
  depends_on = [digitalocean_kubernetes_cluster.kubernetes]

  count = var.helm_enabled ? length(var.helm_nginx_ingress_classes) : 0

  name       = "nginx-ingress"
  namespace  = "nginx-ingress"
  repository = "https://kubernetes-charts.storage.googleapis.com/"
  chart      = "nginx-ingress"
  version    = local.nginx_ingress_version
  wait       = false

  set {
    name     = "podSecurityPolicy.enabled"
    value    = "false" # TODO: var.kubernetes_pod_security_policy
  }

  set {
    name     = "rbac.create"
    value    = "true"
  }

  set {
    name     = "serviceAccount.create"
    value    = "true"
  }

  set {
    name     = "controller.ingressClass"
    value    = var.helm_nginx_ingress_classes[count.index]
  }

  set {
    name     = "controller.replicaCount"
    value    = var.helm_nginx_ingress_replica_counts[count.index]
  }

  set {
    name     = "controller.service.externalTrafficPolicy"
    value    = "Local"
  }

  /* TODO
  set {
    name     = "controller.metrics.enabled"
    value    = "true"
  }

  set {
    name     = "controller.stats.enabled"
    value    = "true"
  }
  */
}

resource "helm_release" "cert_manager_crd" {
  depends_on = [digitalocean_kubernetes_cluster.kubernetes, helm_release.nginx_ingress]

  count = var.helm_enabled ? 1 : 0

  name       = "cert-manager-crd"
  namespace  = "cert-manager-crd"
  repository = "https://taitounited.github.io/taito-charts/"
  chart      = "cert-manager-crd"
  version    = local.cert_manager_version
}

resource "null_resource" "cert_manager_crd_wait" {
  depends_on = [helm_release.cert_manager_crd]

  triggers = {
    helm_enabled         = var.helm_enabled
    cert_manager_version = local.cert_manager_version
  }

  provisioner "local-exec" {
    command = "sleep 30"
  }
}

resource "helm_release" "cert_manager" {
  depends_on = [digitalocean_kubernetes_cluster.kubernetes, null_resource.cert_manager_crd_wait]

  count      = var.helm_enabled ? 1 : 0

  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io/"
  chart      = "cert-manager"
  version    = local.cert_manager_version

  set {
    name     = "global.rbac.create"
    value    = "true"
  }

  set {
    name     = "global.podSecurityPolicy.enabled"
    value    = "false" # TODO: var.kubernetes_pod_security_policy
  }

  set {
    name     = "securityContext.enabled"
    value    = "true"
  }

  set {
    name     = "serviceAccount.create"
    value    = "true"
  }
}

resource "helm_release" "letsencrypt_issuer" {
  depends_on = [digitalocean_kubernetes_cluster.kubernetes, helm_release.cert_manager]

  count      = var.helm_enabled ? 1 : 0

  name       = "letsencrypt-issuer"
  namespace  = "cert-manager"
  chart      = "${path.module}/letsencrypt-issuer"

  set {
    name     = "email"
    value    = var.email
  }
}
