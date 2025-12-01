####################################################################
# Get the rancher cluster as we need the ID to create the project
####################################################################

data "rancher2_cluster_v2" "cluster" {
  name = var.target_cluster_name
  fleet_namespace = "fleet-default"
}
####################################################################

resource "rancher2_project" "rancher_project" {
  name       = var.projekt_name
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
  container_resource_limit {
    requests_cpu = var.container_resource_limit_requests_cpu
    limits_cpu = var.container_resource_limit_limits_cpu
    requests_memory = var.container_resource_limit_requests_memory
    limits_memory = var.container_resource_limit_limits_memory
  }
  
  resource_quota {
    project_limit {
      limits_memory   = var.project_limits_memory
      requests_memory = var.project_requests_memory
      requests_cpu    = var.project_requests_cpu
    }
    namespace_default_limit {
      limits_memory   = var.namespace_default_limits_memory
      requests_memory = var.namespace_default_requests_memory
      requests_cpu    = var.namespace_default_requests_cpu
    }
  }
}