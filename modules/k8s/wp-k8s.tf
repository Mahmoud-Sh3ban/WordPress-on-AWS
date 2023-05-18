resource "kubernetes_deployment" "wpDeploy" {
  depends_on = [
    aws_db_instance.rds_wp
  ]

  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "wordpress-pod"

          env {
            name  = "WORDPRESS_DB_HOST"
            value = aws_db_instance.rds_wp.endpoint
          }
          env {
            name  = "WORDPRESS_DB_USER"
            value = var.db_username
          }
          env {
            name  = "WORDPRESS_DB_PASSWORD"
            value = var.db_password
          }
          env {
            name  = "WORDPRESS_DB_NAME"
            value = "wpdb"
          }

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "wpService" {
  depends_on = [
    kubernetes_deployment.wpDeploy
  ]

  metadata {
    name = "wp-service"
  }

  spec {
    selector = {
      app = "wordpress"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
