variable "aws_region" {
  default = "us-east-2"
}

variable "kube_config_path" {
  default = "~/.kube/config"
}

variable "kube_config_context" {
  default = "minikube"
}
