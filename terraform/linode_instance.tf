resource "linode_instance" "myinstance_instance" {
  count = var.myinstance_node_count
  label = "myinstance-${count.index}"

  region           = var.linode_region
  type             = var.myinstance_node_type
  image            = var.myinstance_image_type
  backups_enabled  = var.myinstance_backups_enabled
  swap_size        = 1024
  booted           = true
  private_ip       = true
  resize_disk      = true
  watchdog_enabled = true

  authorized_keys = var.authorized_keys
  root_pass       = var.root_password
}

resource "linode_domain_record" "myinstance_ipv4_mydomain_com" {
  count = var.myinstance_node_count

  domain_id   = linode_domain.mydomain.id
  name        = "k8s-instance-${count.index}.${var.domain_name_mydomain_com}"
  record_type = "A"
  target      = linode_instance.myinstance_instance[count.index].ip_address
  ttl_sec     = var.domain_default_ttl_sec
}

resource "linode_domain_record" "myinstance_ipv6_mydomain_com" {
  count = var.myinstance_node_count

  domain_id   = linode_domain.mydomain.id
  name        = "k8s-instance-${count.index}.${var.domain_name_mydomain_com}"
  record_type = "AAAA"
  target      = replace(linode_instance.myinstance_instance[count.index].ipv6, "/128", "")
  ttl_sec     = var.domain_default_ttl_sec
}