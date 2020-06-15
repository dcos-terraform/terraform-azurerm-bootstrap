output "admin_username" {
  description = "SSH User"
  value       = module.dcos-bootstrap-instances.admin_username
}

output "public_ip" {
  description = "List of public ip addresses created by this module"
  value       = element(concat(module.dcos-bootstrap-instances.public_ips, [""]), 0)
}

output "private_ip" {
  description = "List of private ip addresses created by this module"
  value       = element(concat(module.dcos-bootstrap-instances.private_ips, [""]), 0)
}

