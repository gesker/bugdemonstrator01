resource "linode_instance_disk" "cfg_instance_boot" {
  count = var.cfg_node_count
  label = "cfg-instance-disk-boot-${count.index}"
  linode_id = linode_instance.cfg_instance[count.index].id
#  size = linode_instance.cfg_instance[count.index].specs.0.disk
  size = 5000
  filesystem = "ext4"
  image = var.cfg_image_type
  root_pass = var.root_password
}

resource "linode_instance" "cfg_instance" {
  count = var.cfg_node_count
  label = "cfg-instance-${count.index}"

  region           = var.linode_region
  type             = var.cfg_node_type
  image            = var.cfg_image_type
  backups_enabled  = var.cfg_backups_enabled
  private_ip       = false
#  resize_disk      = true
  watchdog_enabled = true



      authorized_keys = var.authorized_keys
      root_pass       = var.root_password
}

resource "linode_instance_config" "cfg_instance_config" {
  count = var.cfg_node_count
  label = "cfg-instance-config-${count.index}"
  linode_id = linode_instance.cfg_instance[count.index].id

  booted = true

  devices {
    sda {
      disk_id = linode_instance_disk.cfg_instance_boot[count.index].id
    }
  }

#  interface {
#    purpose = "public"
#  }
#
#  interface {
#    purpose = "vlan"
#    label = "my-vlan"
#    ipam_address = "10.0.1.${count.index}/24"
#  }


}

resource "linode_domain_record" "cfg_ipv4_candela_global" {
  count = var.cfg_node_count

  domain_id   = linode_domain.mydomain.id
  name        = "cfg-instance-${count.index}.${var.domain_name_mydomain_com}"
  record_type = "A"
  target      = linode_instance.cfg_instance[count.index].ip_address
  ttl_sec     = var.domain_default_ttl_sec
}

resource "linode_domain_record" "cfg_ipv6_candela_global" {
  count = var.cfg_node_count

  domain_id   = linode_domain.mydomain.id
  name        = "cfg-instance-${count.index}.${var.domain_name_mydomain_com}"
  record_type = "AAAA"
  target      = replace(linode_instance.cfg_instance[count.index].ipv6, "/128", "")
  ttl_sec     = var.domain_default_ttl_sec
}