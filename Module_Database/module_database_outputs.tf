output "db_private_key" {
    value = tls_private_key.ssh_ehealth.private_key_openssh
}