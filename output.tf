output "main_output" {
  value = "module.aws-en.rds_endpoint"
}

output "k8s_output" {
  value = "module.k8s-env.wp_service_url"
}

output "k8s_output2" {
  value = "module.k8s-env.wp_service_port"
}
