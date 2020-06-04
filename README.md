# Kubernetes infrastructure for Digital Ocean

Kubernetes infrastructure module designed to get you up and running in no time. Provides all the necessary components for running your projects: Kubernetes, NGINX ingress, cert-manager, container registry, databases, database proxies, networking, monitoring, and permissions. Use it either as a module, or as an example for your own customized infrastructure.

This module is used by [infrastructure templates](https://taitounited.github.io/taito-cli/templates#infrastructure-templates) of [Taito CLI](https://taitounited.github.io/taito-cli/). See the [do template](https://github.com/TaitoUnited/taito-templates/tree/master/infrastructure/do/terraform) as an example on how to use this module.


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