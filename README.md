![HashiCorp's Terraform](https://cultivatedops-static.s3.amazonaws.com/thirdparty/terraform/logo-50.png)

This repository is a [Terraform](https://terraform.io/) Module for azurerm virtual machine instances

The module creates AzureRM virtual machine instances

# Usage

Add the module to your Terraform resources like so:

```
module "terraform-azurerm-bootstrap" {
  source = "./terraform-module-terraform-azurerm-instance"
  arg1 = "foo"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_username | SSH User | string | - | yes |
| allow_stopping_for_update | Allow stopping for update (bool) | string | `true` | no |
| dcos_instance_os | Tested OSes to install with prereq | string | - | yes |
| dcos_version | DCOS Version for prereq install | string | - | yes |
| disk_size | Disk Size in GB | string | - | yes |
| disk_type | Disk Type to Leverage. The managed disk type. (optional) | string | `Standard_LRS` | no |
| hostname_format | Format the hostname inputs are index+1, region, name_prefix | string | `instance-%[1]d-%[2]s` | no |
| image | Source image to boot from. We assume the user has already take care of the prereq during this step. | string | - | yes |
| instance_type | Instance Type | string | - | yes |
| location | Location (region) | string | - | yes |
| name_prefix | Cluster Name | string | - | yes |
| network_security_group_id | Network Instance IDs | list | - | yes |
| num_bootstrap | ## Instance Variables ## Number of Instance | string | `1` | no |
| public_ssh_key | SSH Public Key | string | - | yes |
| resource_group_name | Resource Group Name | string | - | yes |
| ssh_private_key_filename | Private SSH Key Filename Optional | string | `/dev/null` | no |
| tags | Add special tags to the resources created by this module | list | `<list>` | no |
| user_data | Customer Provided Userdata | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| admin_username | SSH User |
| dcos_instance_os | Tested OSes to install with prereq |
| dcos_version | DCOS Version for prereq install |
| disk_size | Disk Size in GB |
| disk_type | Disk Type to Leverage |
| image | Source image to boot from |
| instance_type | Instance Type |
| name_prefix | Cluster Name |
| network_security_group_id | Network Instance ID |
| num_bootstrap | Number of Instance |
| private_ips | Private IP Addresses |
| public_ips | Public IP Addresses |
| public_ssh_key | SSH Public Key |
| resource_group_name | Resource Group Name |
| user_data | Customer Provided Userdata |
