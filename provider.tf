provider "kubernetes" {
  host = "https://${data.terraform_remote_state.k8s.endpoint}"
  username = "${data.terraform_remote_state.k8s.username}"
  password = "${data.terraform_remote_state.k8s.password}"
  cluster_ca_certificate = "${base64decode(data.terraform_remote_state.k8s.cluster_ca_certificate)}"  
  client_key = "${base64decode(data.terraform_remote_state.k8s.client_key)}"
  client_certificate = "${base64decode(data.terraform_remote_state.k8s.client_certificate)}"
}