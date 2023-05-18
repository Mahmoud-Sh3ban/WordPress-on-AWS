output "wp_service_url" {
  value = kubernetes_service.wpService.spec[0].cluster_ip
}

output "wp_service_port" {
  value = kubernetes_service.wpService.spec[0].port[0].node_port
}