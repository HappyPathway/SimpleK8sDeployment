resource "kubernetes_service" "service" {
  metadata {
    name = "${var.service_name}"
  }
  spec {
    selector {
      app = "${kubernetes_pod.pod.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port = "${var.service_port}"
      target_port = "${var.service_target_port}"
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "pod" {
  metadata {
    name = "${var.service_name}"
    labels {
      app = "${var.service_name}"
    }
  }

  spec {
    container {
      image = "${var.service_name}:${var.service_version}"
      name  = "${var.service_name}"
    }
  }
}
