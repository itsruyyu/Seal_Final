output "nacl_id" {
  description = "ID of the Network ACL"
  value       = aws_network_acl.example.id
}

output "nacl_association_id" {
  description = "ID of the NACL association"
  value       = aws_network_acl_association.example.id
}
