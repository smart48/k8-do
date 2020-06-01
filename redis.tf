# https://www.terraform.io/docs/providers/do/r/database_cluster.html

resource "digitalocean_database_cluster" "redis-base" {
  count      = length(var.redis_instances)

  name       = var.redis_instances[count.index]
  version    = var.redis_version
  engine     = "redis"
  size       = var.redis_node_sizes[count.index]
  region     = var.region
  node_count = var.redis_node_counts[count.index]

  lifecycle {
    prevent_destroy = true
  }
}