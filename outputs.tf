output "admin_username" {
  description = "admin username"
  value       = "${module.dcos-bootstrap-instances.admin_username}"
}

output "private_ips" {
  description = "List of private ip addresses created by this module"
  value       = ["${module.dcos-bootstrap-instances.private_ips}"]
}

output "public_ips" {
  description = "List of public ip addresses created by this module"
  value       = ["${module.dcos-bootstrap-instances.public_ips}"]
}

output "prereq_id" {
  description = "prereq id"
  value       = "${module.dcos-bootstrap-instances.prereq_id}"
}
