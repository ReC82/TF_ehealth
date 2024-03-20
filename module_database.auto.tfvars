db_root_user = "admin_db"
db_pass      = "P@ssw0rd!123"

db_disk_caching                  = "ReadWrite"
db_nic_id                        = ["value"]
db_src_img_ref_publisher         = "Canonical"
db_srv_disk_name                 = "DISK_DB_EHEALTH"
db_srv_disk_storage_account_type = "Premium_LRS"
db_srv_distrib                   = "Ubuntu"
db_srv_distrib_sku               = "18.04-LTS"
db_srv_distrib_version           = "latest"
db_srv_name                      = "SRV-EHEALTH-DB"
db_srv_size                      = "Standard_DS1_v2"
db_tags = {
  "env" = "prod"
}