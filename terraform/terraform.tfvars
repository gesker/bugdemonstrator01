linode_api_token        = "REDACTED"
root_password           = "REDACTED"
authorized_keys         = [
  "REDACTED"
]

linode_region           = "us-east"
linode_terraform_bucket = "terraform-bucket"

#### Domain ###
domain_external_ipaddress = "162.241.194.205"
#domain_master_ips          = ["162.241.194.205"]
domain_name_mydomain_com = "myinstance.com"
domain_soa_email           = "system.administrator@myinstance.com"
domain_default_ttl_sec     = 3600
domain_default_refresh_sec = 3600
domain_default_retry_sec   = 3600
domain_default_expire_sec  = 3600

### Instance ###
myinstance_node_count      = 1
myinstance_node_type       = "g6-nanode-1"
myinstance_image_type      = "linode/debian12"
myinstance_backups_enabled = false


### Instance with linode_config  ###
cfg_node_count      = 1
cfg_node_type       = "g6-nanode-1"
cfg_image_type      = "linode/debian12"
cfg_backups_enabled = false












