output "instance_public_ip" {
  value = module.ec2.public_ip
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
