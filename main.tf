resource "azurerm_kubernetes_cluster_node_pool" "this" {
  name                  = var.name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  enable_auto_scaling   = var.enable_auto_scaling
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  vnet_subnet_id        = var.vnet_subnet_id
  zones                 = var.zones
  os_type               = var.os_type
  scale_down_mode       = var.scale_down_mode

  # Reference page: https://learn.microsoft.com/en-us/azure/aks/use-labels
  node_labels = merge(
    var.node_labels,
    {
      created-by = "iac-tf",
      type       = "user-pool"
    },
  )
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}
