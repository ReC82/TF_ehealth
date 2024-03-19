#####################
# SSH KEY
#####################
resource "tls_private_key" "ssh_ehealth" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

