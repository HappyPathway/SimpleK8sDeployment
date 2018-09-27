
variable "tfe_version_check_org" {
    default = ""
}

variable "tfe_version_check_workspace" {
    default = ""
}

data "terraform_remote_state" "version_check" {
  backend = "atlas"
  config {
    name = "${var.tfe_version_check_org}/${var.tfe_version_check_workspace}"
  }
}
