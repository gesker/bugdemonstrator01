
resource "linode_domain" "mydomain" {
  type        = "master" # Ignore DNS records at external, Registrar NS records point to Linode
  domain      = var.domain_name_mydomain_com
  soa_email   = var.domain_soa_email
  tags        = ["mydomain"]
  description = var.domain_name_mydomain_com

  ttl_sec     = var.domain_default_ttl_sec
  refresh_sec = var.domain_default_refresh_sec
  retry_sec   = var.domain_default_retry_sec
  expire_sec  = var.domain_default_expire_sec

}

resource "linode_domain_record" "main_A_mydomain" {
  count = var.myinstance_node_count

  domain_id   = linode_domain.mydomain.id
  name        = var.domain_name_mydomain_com
  record_type = "A"
  #  target      = var.domain_external_ipaddress
  target      = linode_instance.myinstance_instance[count.index].ip_address #Target Our WWWW Instances Here at Linode
  ttl_sec     = var.domain_default_ttl_sec


}

resource "linode_domain_record" "main_AAAA_mydomain" {
  count       = var.myinstance_node_count
  domain_id   = linode_domain.mydomain.id
  name        = var.domain_name_mydomain_com
  record_type = "AAAA"
  target      = replace(linode_instance.myinstance_instance[count.index].ipv6, "/128", "")
  #Target Our WWWW Instances Here at Linode
  ttl_sec     = var.domain_default_ttl_sec


}

#### TXT Records ####

resource "linode_domain_record" "SPF_1_mydomain" {
  domain_id   = linode_domain.mydomain.id
  name        = "mydomain.com"
  record_type = "TXT"
  target      = "v=spf1 a mx include:websitewelcome.com ~all"
  ttl_sec     = var.domain_default_ttl_sec
}


