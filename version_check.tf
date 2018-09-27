data "terraform_remote_state" "version_check" {
  backend = "atlas"
  config {
    name = "${var.k8s_organization}/${var.k8s_workspace}-${var.service_name}-VersionCheck"
  }
}
