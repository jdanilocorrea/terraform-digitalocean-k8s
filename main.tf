##########################################
# Locals
##########################################
locals {
  name_prefix = "${var.name_cluster}-cluster"
}
##########################################
# VPC
##########################################
module "vpc" {
  source   = "github.com/jdanilocorrea/terraform//digitalocean/modules/vpc"
  name     = "${local.name_prefix}-vpc"
  region   = var.region
  vpc_cidr = var.vpc_cidr
}

##########################################
# Kubernetes Cluster (DOKS)
##########################################
module "k8s" {
  source             = "github.com/jdanilocorrea/terraform//digitalocean/modules/doks"
  name_cluster       = "${local.name_prefix}-test"
  region             = var.region
  vpc_uuid           = module.vpc.vpc_id
  kubernetes_version = var.kubernetes_version
  tags               = ["${var.do_project_name}", "k8s"]
  node_pools         = var.node_pools
  depends_on         = [module.vpc]
}

##########################################
# Project (associação)
##########################################
module "project" {
  source       = "github.com/jdanilocorrea/terraform//digitalocean/modules/project"
  project_id   = data.digitalocean_project.selected.id
  project_name = var.do_project_name
  resource_urns = [
    module.k8s.cluster_urn
  ]

  depends_on = [module.k8s]
}