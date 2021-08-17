resource "alicloud_resource_manager_resource_group" "this" {
  display_name        = "for-terraform-test"
  resource_group_name = "terratest"
}
module "dcdn" {
  source         = "../../"
  create_domain  = true
  domain_name    = var.domain_name
  check_url      = var.check_url
  sources        = var.sources
  status         = "online"
  domain_configs = var.domain_configs
}
