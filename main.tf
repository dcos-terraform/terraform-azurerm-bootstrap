/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-bootstrap%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-bootstrap/job/support%252F0.2.x/)
 *
 * Azure DC/OS Bootstrap Instance
 * ==============================
 * The module creates AzureRM virtual machine instances
 *
 * EXAMPLE
 * -------
 *
 *```hcl
 * module "dcos-bootstrap-instance" {
 *   source  = "dcos-terraform/bootstrap/azurerm"
 *   version = "~> 0.2.0"
 *
 *   admin_username = "admin"
 *   subnet_ids = "string-myid"
 *   resource_group_name = "example"
 *   public_ssh_key = "~/.ssh/id_rsa.pub"
 * }
 ```
 */

provider "azurerm" {}

module "dcos-bootstrap-instances" {
  source  = "dcos-terraform/instance/azurerm"
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  cluster_name                      = "${var.cluster_name}"
  name_prefix                       = "${var.name_prefix}"
  num                               = "${var.num_bootstrap}"
  location                          = "${var.location}"
  vm_size                           = "${var.vm_size}"
  dcos_instance_os                  = "${var.dcos_instance_os}"
  ssh_private_key_filename          = "${var.ssh_private_key_filename}"
  image                             = "${var.image}"
  disk_type                         = "${var.disk_type}"
  disk_size                         = "${var.disk_size}"
  resource_group_name               = "${var.resource_group_name}"
  network_security_group_id         = "${var.network_security_group_id}"
  custom_data                       = "${var.custom_data == "" && length(var.image) == 0 ? file("${path.module}/cloudinit.tpl") : var.custom_data}"
  admin_username                    = "${var.admin_username}"
  public_ssh_key                    = "${var.public_ssh_key}"
  tags                              = "${var.tags}"
  hostname_format                   = "${var.hostname_format}"
  subnet_id                         = "${var.subnet_id}"
  avset_platform_fault_domain_count = "${var.avset_platform_fault_domain_count}"
}
