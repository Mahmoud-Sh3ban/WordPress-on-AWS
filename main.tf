module "aws-env" {
  source          = "./modules/aws"

}


module "k8s-env" {
  source = "./modules/Kubernetes"

}

