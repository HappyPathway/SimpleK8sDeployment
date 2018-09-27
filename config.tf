
variable "ATLAS_WORKSPACE_SLUG" {
    type = "string"
    description = "Name of TFE Org/Workspace"
}

locals {
    tfe_org = "${element(split("/", var.ATLAS_WORKSPACE_SLUG), 0)}"
    tfe_workspace = "${element(split("/", var.ATLAS_WORKSPACE_SLUG), 1)}"
    service_name = "${element(split("-", var.ATLAS_WORKSPACE_SLUG), 0)}"
}

variable "k8s_workspace" {
    type="string"
    description="Terraform Enterprise k8s Workspace"
}

data "terraform_remote_state" "k8s" {
    backend = "atlas"
    config {
        name = "${local.tfe_org}/${var.k8s_workspace}"
    }
}


data "terraform_remote_state" "build" {
    backend = "atlas"
    config {
        name = "${local.tfe_org}/${local.service_name}-Packer-Build"
    }
}