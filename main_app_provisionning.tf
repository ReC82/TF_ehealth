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

resource "null_resource" "iis_provisioner" {
  connection {
    host     = module.main_app_vnet.public_ip_address[0]
    type     = "winrm"
    user     = "rootUser"
    password = "P@ssw0rd!123"
  }

  provisioner "file" {
    source      = "./Scripts/Web/setup.ps1"
    destination = "C:/inetpub/wwwroot/"
    # C:\inetpub\wwwroot
    /*
    winrm quickconfig
    winrm set winrm/config/service/Auth '@{Basic="true"}'
    winrm set winrm/config/service '@{AllowUnencrypted="true"}'
    winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}'
    */
  }
}

