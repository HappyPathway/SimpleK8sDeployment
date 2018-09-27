data "terraform_remote_state" "version_check" {
  backend = "atlas"
  config {
    name = "${local.tfe_org}/${var.k8s_workspace}-${data.terraform_remote_state.build.service_name}-VersionCheck"
  }
}
