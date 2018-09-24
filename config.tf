variable "k8s_organization" {
    type="string"
    description="Terraform Enterprise k8s Organization"
}


variable "k8s_workspace" {
    type="string"
    description="Terraform Enterprise k8s Workspace"
}


data "terraform_remote_state" "k8s" {
    backend = "atlas"
    config {
        name = "${var.k8s_organization}/${var.k8s_workspace}"
    }
}