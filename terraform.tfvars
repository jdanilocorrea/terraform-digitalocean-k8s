do_project_name = "jdct-k8s-labs"

name_cluster       = "doks"
region             = "nyc3"
kubernetes_version = "1.33.1-do.5"
tags               = ["k8s", "dev", "terraform", "digitalocean"]

node_pools = [
  {
    name  = "worker-pool-1"
    size  = "s-2vcpu-2gb"
    count = 2
    tags  = ["test", "dev"]
  }
]

# default_node_pool_size  = "s-1vcpu-512mb-10gb"
# default_node_pool_count = 1
