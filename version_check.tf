data "terraform_remote_state" "version_check" {
  backend = "atlas"
  config {
    name = "${local.tfe_org}/${local.tfe_label_name}-${var.k8s_workspace}-VersionCheck"
  }
}

