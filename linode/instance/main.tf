# -----------------------------------------------
# Linode Instance
# -----------------------------------------------

locals {
  cluster_name       = "${var.phase}-${var.project}"
  kubernetes_version = "v1.13.4"
}

resource "linode_instance" "example_instance" {
  label           = "by_terraform"
  image           = "linode/ubuntu18.04"
  region          = "${var.region}"
  type            = "g6-standard-1"
  authorized_keys = ["${var.ssh_key}"]
  root_pass       = "${var.root_password}"
}
