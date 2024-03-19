resource "null_resource" "example_provisioner" {
  connection {
    type        = "ssh"
    host        = module.main_app_vnet.public_ip_address[2]
    user        = var.db_root_user
    port        = 22
    agent       = false
    password    = var.db_pass
    private_key = file("./key")
  }

  // copy our example script to the server
  provisioner "file" {
    source      = "Scripts/Database/setup.sh"
    destination = "/tmp/setup.sh"
  }

  // change permissions to executable and pipe its output into a new file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "/tmp/setup.sh > /tmp/result.txt",
    ]
  }
}