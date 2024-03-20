api_root_user = "admin_api"
api_pass      = "P@ssw0rd!123"

api_disk_caching                  = "ReadWrite"
api_nic_id                        = ["value"]
api_src_img_ref_publisher         = "Canonical"
api_srv_disk_name                 = "DISK_API_EHEALTH"
api_srv_disk_storage_account_type = "Premium_LRS"
api_srv_distrib                   = "Ubuntu"
api_srv_distrib_sku               = "18.04-LTS"
api_srv_distrib_version           = "latest"
api_srv_name                      = "SRV-EHEALTH-API"
api_srv_size                      = "Standard_DS1_v2"
api_tags = {
  "env" = "prod"
}