locals {
  domain_name = var.create_domain == true ? concat(alicloud_dcdn_domain.this.*.id, [""])[0] : var.domain_name
}