variable "image_pull_secrets" {
  default = "dockerhub"
}

variable "service_repo" {
  default = "happypathway"
}

resource "kubernetes_service" "service" {
  metadata {
    name = "${data.terraform_remote_state.build.service_name}"
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
    name = "${data.terraform_remote_state.build.service_name}"
    labels {
      app = "${data.terraform_remote_state.build.service_name}"
    }
  }

  spec {
    container {
      image = "${var.service_repo}/${data.terraform_remote_state.build.service_name}:${data.terraform_remote_state.build.service_version}"
      name  = "${data.terraform_remote_state.build.service_name}"
      image_pull_policy = "Always"
    }
    image_pull_secrets {
      name = "${var.image_pull_secrets}"
    }
  }
}
