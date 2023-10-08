variable "linode_api_token" {
  sensitive = true
}

variable "linode_region" {
  default = "us-east"
}

variable "linode_terraform_bucket" {
  default = "terraform-bucket"
}

variable "linode_key" {
  default = "terraform-state.tfstate"
}

variable "root_password" {
  type    = string
  # openssl rand -base64 16
  default = "SetMeInTerraformTfVarsFile"
}

variable "authorized_keys" {
  type    = list(string)
  default = ["SetMeInTerraformTfVars"]
}




variable "cfg_node_count" {
  type    = number
  default = 1
}

variable "cfg_node_type" {
  type    = string
  default = "g6-nanode-1"
}

variable "cfg_image_type" {
  type    = string
  default = "linode/debian12"
}

variable "cfg_backups_enabled" {
  type    = bool
  default = false
}














variable "myinstance_node_count" {
  type    = number
  default = 1
}

variable "myinstance_node_type" {
  type    = string
  default = "g6-nanode-1"
}

variable "myinstance_image_type" {
  type    = string
  default = "linode/debian12"
}

variable "myinstance_backups_enabled" {
  type    = bool
  default = false
}


#### Domain ###
variable "domain_external_ipaddress" {
  type    = string
  default = "162.241.194.222"
}

#variable "domain_master_ips" {
#  type    = list(string)
#  default = ["162.241.194.222"]
#}

variable "domain_name_mydomain_com" {
  type    = string
  default = "mydomain.com"
}

variable "domain_soa_email" {
  type    = string
  default = "system.administrator@mydomain.com"
}

variable "domain_default_ttl_sec" {
  type    = number
  default = 14400
}

variable "domain_default_refresh_sec" {
  type    = number
  default = 14400
}

variable "domain_default_retry_sec" {
  type    = number
  default = 14400
}

variable "domain_default_expire_sec" {
  type    = number
  default = 14400
}













