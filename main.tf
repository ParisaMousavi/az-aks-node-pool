resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = var.name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  node_count            = var.node_count
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}